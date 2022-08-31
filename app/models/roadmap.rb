class Roadmap < ApplicationRecord
  has_many :checkpoints, dependent: :destroy

  validates :title, presence: true
  validates :project_link, presence: true
  validates :project_link,
            format: { with: %r{\A(https?://)?([\da-z.-]+)\.([a-z.]{2,6})([/\w.-]*)*/?\Z}i }
end
