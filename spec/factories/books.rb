FactoryBot.define do
  factory :book do
    author { nil }
    title { "MyString" }
    isbn { "MyString" }
    description { "MyText" }
    publish_year { 1 }
    price { "9.99" }
  end
end
