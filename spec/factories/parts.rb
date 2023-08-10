FactoryBot.define do
  factory :part do
    title { Faker::Lorem.word.capitalize }
    description { Faker::Lorem.sentence }
    supplier
  end
end
