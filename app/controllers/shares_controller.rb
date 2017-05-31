class SharesController < ApplicationController
  before_filter :disable_nav, only: [:new, :edit]

  def new
    @quizzs = current_user.quizzs
    @classrooms = current_user.teaching_classrooms
    @share = Share.new
  end

  def create
    @quizzs = current_user.quizzs
    @classrooms = current_user.teaching_classrooms
    @share = Share.new(share_params)
    if @share.save
      flash[:alert] = "Already shared with this classroom" unless @share.valid?
      @share.classroom.students.each do |student|
        UserMailer.new_quizz(student, @share.quizz).deliver_now
      end

      redirect_to quizzs_path
     else
      flash[:alert] = "Already shared with this classroom"
      render :new
     end
  end

  private

  def share_params
    params.require(:share).permit(:quizz_id,:classroom_id)
  end

  def disable_nav
    @disable_nav = true
  end
end
