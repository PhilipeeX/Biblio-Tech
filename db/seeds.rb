# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Author.create(nome: "John Doe",
biography: "A talented writer with many published works.",
nationality: "USA",
birth_date: Date.new(1980, 1, 1),
literary_genre: "Fiction",
bibliography: "List of published books",
contacts: "johndoe@example.com")