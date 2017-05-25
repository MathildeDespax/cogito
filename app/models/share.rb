class Share < ApplicationRecord
  belongs_to :classroom
  belongs_to :quizz

  validates :classroom_id, uniqueness: {scope: :quizz_id}
end
