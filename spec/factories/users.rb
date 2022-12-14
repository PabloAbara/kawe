# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           not null
#
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@fin.cl" }
    name { "Test2" }
    password { "123456" }
    password_confirmation { "123456" }
    role { "mentor" }
  end
end
