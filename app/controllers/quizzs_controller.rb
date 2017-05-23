class QuizzsController < ApplicationController

  def index
    @quizzs = Quizz.all
  end

  def show
  end

  def new
    @quizz = Quizz.new
  end

  def create
  end

  def update
  end

  def destroy
  end

end
