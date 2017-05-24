class QuizzsController < ApplicationController
  def index
    @quizzs = current_user.quizzs
  end

  def show
    @quizz = Quizz.find(params[:id])
  end

  def new
    @quizz = Quizz.new
  end

  def create
    @quizz = current_user.quizzs.new(quizz_params)
    if @quizz.save
     redirect_to quizz_path(@quizz)
    else
      render :new
    end
  end

  def edit
    @quizz = Quizz.find(params[:id])
  end

  def update
    @quizz = Quizz.find(params[:id])
    if @quizz.update(quizz_params)
      render "quizzs/show"
    else
      render "quizzs/edit"
    end
  end

  def destroy
    @quizz = Quizz.find(params[:id])
    @quizz.destroy
    redirect_to quizzs_path(@quizz.teacher)
  end

  private
  def quizz_params
    params.require(:quizz).permit(:name, :subject)
  end
end
