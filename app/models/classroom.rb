class Classroom < ApplicationRecord
  has_many :user_classrooms

  has_many :students, through: :user_classrooms, source: :user
  has_many :student_evaluations, through: :students

  has_many :shares
  has_many :quizzs, through: :shares

  belongs_to :teacher, class_name: "User", foreign_key: :user_id

  validates :name, presence: true

  def piechart(quizz)
    self.student_evaluations
    .joins(:card)
    .where(cards: {quizz_id: quizz.id})
    .group(:evaluation)
    .count
  end

  def barchart(card)
    self.student_evaluations
    .where(card: card)
    .group(:evaluation)
    .count
  end

  def chart_stat_old(quizz)
    cards = [{ name: "good", data: []}, { name: "soso", data: []}, { name: "bad", data: []}]
    rating = ["good", "soso", "bad"]
    quizz.cards.each_with_index do |card, i|
      self.barchart(card).each do |k, v|
        if v != 0
        j = rating.index(k)
        cards[j][:data] << ["#{i+1}", v]
        else
        j = rating.index(k)
        cards[j][:data] << ["#{i+1}", 0]
        end
      end
    end
    cards
  end

  def chart_stat(quizz)
    cards = [{ name: "good", data: []}, { name: "soso", data: []}, { name: "bad", data: []}]
    rating = ["good", "soso", "bad"]
    quizz.cards.each_with_index do |card, i|
      cards[0][:data] << ["#{i+1}", 0]
      cards[1][:data] << ["#{i+1}", 0]
      cards[2][:data] << ["#{i+1}", 0]
      self.barchart(card).each do |k, v|
        j = rating.index(k)
        cards[j][:data][i][1] = v
      end
    end
    cards
  end
end
