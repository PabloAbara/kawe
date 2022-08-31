class ResourceRating < ApplicationRecord
  belongs_to :user
  belongs_to :resource
  validates :rating, inclusion: { in: 1..5 }
end
