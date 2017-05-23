class Share < ApplicationRecord
  belongs_to :classroom
  belongs_to :quizz
end
