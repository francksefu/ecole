class Promotion < ApplicationRecord
  belongs_to :classroom
  belongs_to :student
  belongs_to :year

  has_many :observation_disciplinaries

  has_many :evaluates
  has_many :courses, through: :evaluates
  has_many :render_works

  validates :classroom_id, presence: true
  validates :student_id, presence: true
  validates :year_id, presence: true
end
