class Quizz < ApplicationRecord
  has_many :shares, dependent: :destroy
  has_many :classrooms, through: :shares

  has_many :cards, -> { order(position: :asc) }, dependent: :destroy
  has_many :student_evaluations, through: :cards

  has_attachment :photo

  belongs_to :teacher, class_name: "User", foreign_key: :user_id

  validates :name, presence: true
  validates :subject, presence: true



end
