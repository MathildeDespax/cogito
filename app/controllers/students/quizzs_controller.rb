class Students::QuizzsController < ApplicationController
  # def index
  #   # Let's anticipate on next week (with login)
  #   @quizzs = student.quizzs
  # end

  def show
    @quizz = Quizz.find(params[:id])
  end

end

