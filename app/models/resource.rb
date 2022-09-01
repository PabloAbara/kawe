class Resource < ApplicationRecord
  belongs_to :checkpoint
  has_many :resource_ratings, dependent: :destroy

  validates :title, presence: true
  validates :link, presence: true
  validates :link, uniqueness: { message: "ya existe" }
end
