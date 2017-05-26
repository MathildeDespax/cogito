class ClassroomsController < ApplicationController
  def index
    @classrooms = current_user.teaching_classrooms
  end

  def show
    @quizzs = current_user.quizzs
    @classroom = Classroom.find(params[:id])
    @cards = [
      {
        name: "good",
        data: [["question 1", 8], ["question 2", 7], ["question 3", 6], ["question 4", 2], ["question 5", 8], ["question 6", 6], ["question 7", 0], ["question 8", 3]]
      },
      {
        name: "soso",
        data: [["question 1", 1], ["question 2", 1], ["question 3", 1], ["question 4", 5], ["question 5", 0], ["question 6", 2], ["question 7", 3], ["question 8", 3]]
      },
      {
        name: "bad",
        data: [["question 1", 0], ["question 2", 1], ["question 3", 2], ["question 4", 2], ["question 5", 0], ["question 6", 0], ["question 7", 5], ["question 8", 2]]
      }
    ]

  end
end
