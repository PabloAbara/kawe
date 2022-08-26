class CompletedCheckpoint < ApplicationRecord
  belongs_to :user
  belongs_to :checkpoint
end
