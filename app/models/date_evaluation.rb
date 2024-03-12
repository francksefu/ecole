class DateEvaluation < ApplicationRecord
  belongs_to :classroom_course
  belongs_to :periode
  has_many :evaluates
  has_many :give_works
end
