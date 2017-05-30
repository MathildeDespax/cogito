class Students::QuizzsController < ApplicationController
  # def index
  #   # Let's anticipate on next week (with login)
  #   @quizzs = student.quizzs
  # end
  before_filter :disable_nav, only: [:show]

  def index
    @quizzs = Quizz.all
  end

  def show
    @quizz = Quizz.find(params[:id])
    @student_evaluation = StudentEvaluation.new
  end

  private

  def disable_nav
    @disable_nav = true
  end
end


