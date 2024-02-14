class ObservationDisciplinary < ApplicationRecord
  validates :observation, presence: true
  validates :promotion_id, presence: true
end
