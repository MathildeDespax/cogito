class StudentEvaluationsController < ApplicationController

  def new
    @student_evaluation = StudentEvaluation.new
  end

  def create
    @student = current_user
    @card = Card.find(params[:card_id])
    @student_evaluation = StudentEvaluation.new(student_evaluation_params)
    @student_evaluation.user = @student
    @student_evaluation.card = @card
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


private
  def student_evaluation_params
    params.require(:student_evaluation).permit(:evaluation)
  end


 end
