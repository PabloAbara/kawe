# == Schema Information
#
# Table name: roadmaps
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  project_link :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Roadmap < ApplicationRecord
  has_many :checkpoints, dependent: :destroy

  validates :title, presence: true
  validates :project_link, presence: true
  validates :project_link,
            format: { with: %r{\A(https?://)?([\da-z.-]+)\.([a-z.]{2,6})([/\w.-]*)*/?\Z}i }
end
