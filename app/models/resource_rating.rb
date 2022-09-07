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
class ResourceRating < ApplicationRecord
  belongs_to :user
  belongs_to :resource

  validates :rating, inclusion: { in: 1..5 }
  validates :resource_id, uniqueness: { scope: :user_id }
end
