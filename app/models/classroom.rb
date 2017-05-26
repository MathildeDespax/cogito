class Classroom < ApplicationRecord
  has_many :user_classrooms

  has_many :students, through: :user_classrooms, source: :user
  has_many :student_evaluations, through: :students

  has_many :shares
  has_many :quizzs, through: :shares

  belongs_to :teacher, class_name: "User", foreign_key: :user_id

  validates :name, presence: true

  def piechart(quizz)
    student_evaluations
    .joins(:card)
    .where(cards: {quizz_id: quizz.id})
    .group(:evaluation)
    .count
  end

  def barchart(card)
    student_evaluations
    .where(card: card)
    .group(:evaluation)
    .count
  end

end
