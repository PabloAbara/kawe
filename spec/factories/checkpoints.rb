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
FactoryBot.define do
  factory :checkpoint do
    title { "GitHub" }
    association :roadmap
  end
end
