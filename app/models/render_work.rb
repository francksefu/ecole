class RenderWork < ApplicationRecord
  belongs_to :give_work
  belongs_to :promotion
  has_many_attached :images
end
