class StudentEvaluation < ApplicationRecord
  belongs_to :card
  belongs_to :user

  validates :evaluation, presence: true

  enum evaluation: [ :bad, :soso, :good ]
end
