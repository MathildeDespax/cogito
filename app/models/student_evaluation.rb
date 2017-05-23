class StudentEvaluation < ApplicationRecord
  belongs_to :card
  belongs_to :user

  enum evaluation: [ :bad, :soso, :good ]
end
