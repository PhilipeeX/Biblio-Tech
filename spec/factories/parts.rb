FactoryBot.define do
  factory :part do
    title { Faker::Lorem.word.capitalize }
    description { Faker::Lorem.sentence }
    price { rand(1.0..1000.0).round(2) }
    supplier
  end
end
