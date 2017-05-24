class CardsController < ApplicationController
  def index

  end

  def new
    @card = Card.new
  end

  def create
    @quizz = Quizz.find(params[:quizz_id])
    @card = @quizz.cards.new(card_params)
    if @card.save
     redirect_to quizz_path(@quizz)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @quizz = Quizz.find(params[:quizz_id])
    @card = Card.find(params[:card_id])
    @card.destroy
    redirect_to quizzs_path(@quizz)
  end

  private
  def card_params
    params.require(:card).permit(:question, :answer)
  end
end
