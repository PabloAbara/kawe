FactoryBot.define do
  factory :checkpoint do
    title { "GitHub" }
    association :roadmap
  end
end
