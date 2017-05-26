class Quizz < ApplicationRecord
  has_many :shares
  has_many :classrooms, through: :shares

  has_many :cards, -> { order(position: :asc) }, dependent: :destroy
  has_many :student_evaluations, through: :cards


  belongs_to :teacher, class_name: "User", foreign_key: :user_id

  validates :name, presence: true
  validates :subject, presence: true

  def chart_stat(classroom)
    cards = [{ name: "good", data: []}, { name: "soso", data: []}, { name: "bad", data: []}]
    rating = ["good", "soso", "bad"]
    self.cards.each_with_index do |card, i|
      classroom.barchart(card).each do |k, v|
        j = rating.index(k)
        cards[j][:data] << ["question #{i+1}", v]
      end
    end
    cards
  end

end
