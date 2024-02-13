class ObservationDisciplinary < ApplicationRecord
  belongs_to :discipline_director
  belongs_to :promotion
  validates :observation, presence: true
  validates :promotion_id, presence: true
end
