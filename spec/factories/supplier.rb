FactoryBot.define do
  factory :supplier do
    name { Faker::Bank.name }
    cnpj { Faker::Company.brazilian_company_number }
  end
end