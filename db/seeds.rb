# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Criação do autor
Asimov = Author.create(
  nome: "Isaac Asimov",
  biography: "Isaac Asimov was a prolific science fiction writer known for his groundbreaking works in the genre. With a keen interest in science and a talent for storytelling, he captivated readers with his imaginative stories and thought-provoking ideas. Asimov's extensive bibliography includes popular works like the Foundation series, the Robot series, and many more.",
  nationality: "American",
  birth_date: Date.new(1920, 1, 2),
  literary_genre: "Science Fiction",
  bibliography: "Foundation series, Robot series, I, Robot, The Caves of Steel, The Naked Sun, etc.",
  contacts: "isaacasimov@example.com"
)

# Criação do livro relacionado ao autor
Book.create(
  author: Asimov,
  title: "Foundation",
  isbn: "9781234567890",
  description: "An institute founded by psychohistorian Hari Seldon to preserve the best of galactic civilization after the collapse of the Galactic Empire.",
  publish_year: 1951,
  price: 39.99
)