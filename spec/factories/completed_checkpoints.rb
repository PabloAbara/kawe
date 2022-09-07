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
FactoryBot.define do
  factory :completed_checkpoint do
    user
    checkpoint
  end
end
