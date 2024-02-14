class Schedule < ApplicationRecord
  belongs_to :classroom
  validates :classroom_id, presence: true
end
