FactoryBot.define do
  factory :author do
    name { Faker::Name.name }
    cpf { FFaker::IdentificationBR.cpf }
  end
end