FactoryBot.define do
  factory :account do
    bank { "Santander" }
    number { Faker::Number.number(digits: 10) }
    digit { rand(0..9).to_s }
    supplier
  end
end
