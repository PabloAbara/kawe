class Resource < ApplicationRecord
  belongs_to :checkpoint
  has_many :resource_ratings, dependent: :destroy

  validates :link, format: { with: %r{\A(https?://)?([\da-z.-]+)\.([a-z.]{2,6})([/\w.-]*)*/?\Z}i }
end
