FactoryBot.define do
  factory :book do
    association :author, factory: :author, nome: "Isaac Asimov"
    title { "Foundation" }
    isbn { "9781234567890" }
    description { "An institute founded by psychohistorian Hari Seldon to preserve the best of galactic civilization after the collapse of the Galactic Empire." }
    publish_year { 1951 }
    price { "39.99" }
  end
end
