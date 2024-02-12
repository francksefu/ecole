class DateEvaluation < ApplicationRecord
  belongs_to :classroom_course
  belongs_to :periode
  has_many :evaluates
end
