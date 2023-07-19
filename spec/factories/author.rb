FactoryBot.define do
  factory :author do
    nome { "Isaac Asimov" }
    biography { "Isaac Asimov was a prolific science fiction writer known for his groundbreaking works in the genre. With a keen interest in science and a talent for storytelling, he captivated readers with his imaginative stories and thought-provoking ideas. Asimov's extensive bibliography includes popular works like the Foundation series, the Robot series, and many more." }
    nationality { "American" }
    birth_date { Date.new(1920, 1, 2) }
    literary_genre { "Science Fiction" }
    bibliography { "Foundation series, Robot series, I, Robot, The Caves of Steel, The Naked Sun, etc." }
    contacts { "isaacasimov@example.com" }
  end
end
