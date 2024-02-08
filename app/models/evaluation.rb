class Evaluation < ApplicationRecord
  belongs_to :course
  belongs_to :promotion
  belongs_to :periode

  validates :course_id, presence: true
  validates :promotion_id, presence: true
  validates :year_id, presence: true
  validates :periode_id, presence: true
end
