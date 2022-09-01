class Resource < ApplicationRecord
  belongs_to :checkpoint
  has_many :resource_ratings, dependent: :destroy
end
