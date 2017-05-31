class CardsController < ApplicationController

  before_filter :disable_nav, only: [:new, :edit]
  def new

    @quizz = Quizz.find(params[:quizz_id])
    @card = Card.new
  end

  def create
    @quizz = Quizz.find(params[:quizz_id])
    @card = @quizz.cards.new(card_params)
    @card.save
    redirect_to quizz_path(@quizz)
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @quizz = @card.quizz
    if @card.update(card_params)
      redirect_to quizz_path(@quizz)
    else
      redirect_to edit_card_path(@card)
    end
  end

  def destroy
    card = Card.find(params[:id])
    card.destroy
    redirect_to quizz_path(card.quizz)
  end

  private
  def card_params
    params.require(:card).permit(:question, :answer)
  end

    private

  def disable_nav
    @disable_nav = true
  end

end
