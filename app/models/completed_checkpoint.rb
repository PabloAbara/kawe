# == Schema Information
#
# Table name: completed_checkpoints
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  checkpoint_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class CompletedCheckpoint < ApplicationRecord
  belongs_to :user
  belongs_to :checkpoint

  validates :checkpoint_id, uniqueness: { scope: :user_id }
end
