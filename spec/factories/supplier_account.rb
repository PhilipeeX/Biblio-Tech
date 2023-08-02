FactoryBot.define do
  factory :account do
    bank { "Nubank" }
    number { Faker::Number.number(digits: 10) }
    digit { rand(0..9).to_s }
    supplier
  end
end
