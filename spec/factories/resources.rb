FactoryBot.define do
  factory :resource do
    title { "Un gran video de Rails" }
    link { "https://www.youtube.com/watch?v=lGLade0I8xw" }
    checkpoint
  end
end
