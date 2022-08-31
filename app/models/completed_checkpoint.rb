class CompletedCheckpoint < ApplicationRecord
  belongs_to :user
  belongs_to :checkpoint

  validates :checkpoint_id, uniqueness: { scope: :user_id }
end
