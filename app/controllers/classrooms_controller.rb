class ClassroomsController < ApplicationController
  def index
    @classrooms = current_user.teaching_classrooms
  end

  def show
    @classroom = Classroom.find(params[:id])
    @shares = Share.joins(:classroom).where("classrooms.id = ? AND classrooms.user_id = ?", @classroom.id, current_user.id )
  end

end
