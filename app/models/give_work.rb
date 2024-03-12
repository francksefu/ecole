class GiveWork < ApplicationRecord
  belongs_to :date_evaluation
  has_many :render_works
  has_many_attached :images
end
