class Share < ApplicationRecord
  belongs_to :classroom
  belongs_to :quizz

  validates :quizz_id, presence: true

end
