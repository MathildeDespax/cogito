class Quizz < ApplicationRecord
  has_many :shares
  has_many :classrooms, through: :shares

  has_many :cards

  belongs_to :teacher, class_name: "User", foreign_key: :user_id

  validates :name, presence: true
  validates :subject, presence: true
end
