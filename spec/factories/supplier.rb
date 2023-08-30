FactoryBot.define do
  factory :supplier do
    name { Faker::Bank.name }
    cnpj { '35.035.289/0001-69' }
  end
end