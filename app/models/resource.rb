# == Schema Information
#
# Table name: resources
#
#  id            :bigint           not null, primary key
#  title         :string           not null
#  link          :string           not null
#  checkpoint_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Resource < ApplicationRecord
  belongs_to :checkpoint
  has_many :resource_ratings, dependent: :destroy

  validates :title, presence: true
  validates :link, presence: true
  validates :link, uniqueness: { message: "ya existe" }
end
