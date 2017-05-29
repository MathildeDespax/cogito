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
    # notfiy student
    # TODO: refacto avec un job
    # NotifyStudent.perform_now
    # ============================
    @share.classroom.students.each do |student|
      # notify student
      # a remplacer par Twillio
      UserMailer.new_quizz(student, @share.quizz).deliver_now
    end
    # ============================

    redirect_to quizzs_path
  end

  private

  def share_params
    params.require(:share).permit(:quizz_id,:classroom_id)
  end
end
