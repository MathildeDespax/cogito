class Share < ApplicationRecord
  belongs_to :classroom
  belongs_to :quizz

  validates :quizz_id, presence: true
  validates :quizz_id, uniqueness: {scope: :classroom_id}

end
