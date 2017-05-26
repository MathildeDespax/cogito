class StudentEvaluationsController < ApplicationController

  def new
    @student_evaluation = StudentEvaluation.new
  end

  def create
    @student = current_user
    @card = Card.find(params[:card_id])
    @student_evaluation = StudentEvaluation.new(user: @student, card: @card)
    if @student_evaluation.save
      respond_to do |format|
         format.html { redirect_to students_quizz_path(@card.quizz) }
         format.js  # <-- will render `app/views/reviews/create.js.erb`
       end
     else
       respond_to do |format|
         format.html { render 'students/quizzs/show' }
         format.js  # <-- idem
       end
    end
  end
 end
