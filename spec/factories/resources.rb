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
    title { "Un gran video de Rails" }
    link { "https://www.youtube.com/watch?v=lGLade0I8xw" }
    checkpoint
  end
end
