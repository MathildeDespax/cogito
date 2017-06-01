class Share < ApplicationRecord
  belongs_to :classroom
  belongs_to :quizz

  validates :quizz_id, presence: true
  validates :classroom_id, uniqueness: {scope: :quizz_id, message: "This quizz has alreaby been shared to this classroom"}

end
