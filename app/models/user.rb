class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :quizzs

  has_many :teaching_classrooms, class_name: "Classroom", foreign_key: "user_id"

  has_many :user_classrooms
  has_many :student_classrooms, through: :user_classrooms, source: :classroom

  has_many :student_evaluations
  has_many :cards, through: :student_evaluations

  validates :first_name, presence: true
  validates :last_name, presence: true

  def teacher?
    !quizzs.empty?
  end

  def student?
    !user_classrooms.empty?
  end

end
