FactoryBot.define do
  factory :author do
    nome { "John Doe" }
    biography { "A talented writer with many published works." }
    nationality { "USA" }
    birth_date { Date.new(1980, 1, 1) }
    literary_genre { "Fiction" }
    bibliography { "List of published books" }
    contacts { "johndoe@example.com" }
  end
end
