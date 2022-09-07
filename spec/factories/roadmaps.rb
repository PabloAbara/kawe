# == Schema Information
#
# Table name: roadmaps
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  project_link :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :roadmap do
    title { "Kawe" }
    project_link { "https://github.com/PabloAbara/kawe" }
  end
end
