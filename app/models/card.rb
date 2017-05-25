class Card < ApplicationRecord
  has_many :student_evaluations
  has_many :students, through: :student_evaluations, source: :user

  belongs_to :quizz
  acts_as_list scope: :quizz

  validates :question, presence: true
  validates :answer, presence: true
end
