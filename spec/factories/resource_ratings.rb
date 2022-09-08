# == Schema Information
#
# Table name: resource_ratings
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  resource_id :bigint           not null
#  rating      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :resources_ratings do
    rating { 5 }
    user
    resource
  end
end
