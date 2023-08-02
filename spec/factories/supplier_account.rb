FactoryBot.define do
  factory :account do
    bank { "Nubank" }
    number { Faker::Number.number(digits: 10) }
    supplier
  end
end
