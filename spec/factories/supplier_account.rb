FactoryBot.define do
  factory :account do
    bank { "Santander" }
    number { '261533' }
    digit { '9' }
    supplier
  end
end
