FactoryBot.define do
  factory :supplier do
    name { Faker::Bank.name }
    cnpj { Faker::CNPJ.unique.numeric }
  end
end