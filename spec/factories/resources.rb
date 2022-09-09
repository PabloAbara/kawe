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
FactoryBot.define do
  factory :resource do
    sequence(:link) { |n| "https://www.recurso#{n}.com" }
    sequence(:title) { |n| "Recurso número #{n}" }
    checkpoint
  end
end
