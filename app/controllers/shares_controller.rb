class SharesController < ApplicationController
  def new
    @quizzs = current_user.quizzs
    @classrooms = current_user.teaching_classrooms
    @share = Share.new
  end

  def create
    @share = Share.new(share_params)
    @share.save
    flash[:alert] = "Already shared with this classroom" unless @share.valid?
    redirect_to quizz_path(@share.quizz)
  end

  private

  def share_params
    params.require(:share).permit(:quizz_id,:classroom_id)
  end
end
