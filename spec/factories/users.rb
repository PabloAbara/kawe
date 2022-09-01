FactoryBot.define do
  factory :user do
    email { "test1@fin.cl" }
    name { "Test2" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end