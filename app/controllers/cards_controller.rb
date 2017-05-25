class CardsController < ApplicationController
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
    @card = Card.find(params[:id])
  end

   def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      redirect_to quizz_path(@card.quizz)
    else
      render "card/:id/edit"
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
end
