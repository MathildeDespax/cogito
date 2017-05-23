class Classroom < ApplicationRecord
  has_many :user_classrooms

  has_many :students, through: :user_classrooms, source: :user

  has_many :shares
  has_many :quizzs, through: :shares

  belongs_to :teacher, class_name: "User", foreign_key: :user_id

  validates :name, presence: true
end
