class StudiesDirector < ApplicationRecord
  include AssociateUser
  
  belongs_to :user
end
