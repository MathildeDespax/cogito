class Share < ApplicationRecord
  belongs_to :classroom
  belongs_to :quizz

  validates :classroom_id, uniqueness: {scope: :quizz_id}, presence: true
  validates :quizz_id, presence: true

end
