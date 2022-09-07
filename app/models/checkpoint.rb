# == Schema Information
#
# Table name: checkpoints
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  roadmap_id :bigint           not null
#
class Checkpoint < ApplicationRecord
  belongs_to :roadmap

  has_many :resources, dependent: :destroy
  has_many :completed_checkpoints, dependent: :destroy
  has_many :users, through: :completed_checkpoints

  validates :title, presence: true
end
