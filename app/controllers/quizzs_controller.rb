class QuizzsController < ApplicationController
  def index
    @quizzs = Quizz.all
  end

  def show
    @quizz = Quizz.find(params[:id])
  end

  def new
    @quizz = Quizz.new
  end

  def create
    @quizz = Quizz.new(quizz_params)
    @quizz.teacher = current_user
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
      if @quizz.update(params[:quizz])
        render "quizz/show"
      else
        render "quizz/edit"
      end
  end

  def destroy
    @quizz = Quizz.find(params[:id])
    @quizz.destroy
    redirect_to user_quizzs_path(@quizz.teacher)
  end

  private
  def quizz_params
    params.require(:quizz).permit(:name, :subject)
  end

end
