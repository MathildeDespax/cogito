class SharesController < ApplicationController
  # before_action :disable_nav, only: [:new, :edit]

  def new
    @classrooms = current_user.teaching_classrooms
    @share = Share.new
    @quizz = Quizz.find(params[:quizz_id])
    render layout: false
  end

  def create
    @quizz = Quizz.find(params[:quizz_id])
    @classrooms = current_user.teaching_classrooms
    @share = Share.new(share_params)
    @share.quizz = @quizz
    if @share.save
      @share.classroom.students.each do |student|
        UserMailer.new_quizz(student, @share.quizz).deliver_now
      end
      respond_to do |format|
        format.html {
          # redirect_to quizzs_path, notice: "Quizz shared with #{@share.classroom.name}"
        }
        format.js # render shares/create.js.erb
      end
     else
      respond_to do |format|
        format.html {
          flash[:alert] = "Already shared with this classroom"
          render :new
        }
        format.js # render shares/create.js.erb
      end

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
