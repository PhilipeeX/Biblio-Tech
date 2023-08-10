# spec/factories/books.rb
FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    isbn { "9780470059029" }
    author
  end
end