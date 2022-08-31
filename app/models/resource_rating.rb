class ResourceRating < ApplicationRecord
  belongs_to :user
  belongs_to :resource

  validates :rating, inclusion: { in: 1..5 }
  validates :resource_id, uniqueness: { scope: :user_id, message: "El usuario ya ha evaluado este Recurso." }
end