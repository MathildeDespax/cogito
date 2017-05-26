class Students::QuizzsController < ApplicationController
  # def index
  #   # Let's anticipate on next week (with login)
  #   @quizzs = student.quizzs
  # end
  def index
    @quizzs = Quizz.all
  end

  def show
    @card = Card.new
    @quizz = Quizz.find(params[:id])
  end

end


