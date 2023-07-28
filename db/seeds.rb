# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Criação do author
asimov = Author.create(
  name: 'Isaac Asimov'
)

clarke = Author.create( name: 'Arthur C. Clarke' )

# Livros escritos por Isaac Asimov
Book.create(
  title: 'Foundation',
  author: asimov
)
Book.create(
  title: 'Foundation and Empire',
  author: asimov
)
Book.create(
  title: 'Second Foundation',
  author: asimov
)
Book.create(
  title: 'I, Robot',
  author: asimov
)
Book.create(
  title: 'The Caves of Steel',
  author: asimov
)

# Livros escrios por Clarcke
Book.create(
  title: '2001: A Space Odyssey',
  author: clarke
)
Book.create(
  title: 'Rendezvous with Rama',
  author: clarke
)
Book.create(
  title: 'Childhood\'s End',
  author: clarke
)
Book.create(
  title: 'The Fountains of Paradise',
  author: clarke
)
Book.create(
  title: 'The City and the Stars',
  author: clarke
)

# Criação dos fornecedores
booksgood = Supplier.create(
  name: 'booksgood'
)

sellbookcompany = Supplier.create(
  name: 'SellBook Company'
)

# Criação das contas dos fornecedores
Account.create(
  bank: 'Banco do Brasil',
  number: 123456,
  supplier: sellbookcompany
)

Account.create(
  bank: 'Itaú Unibanco',
  number: 789012,
  supplier: sellbookcompany
)

Account.create(
  bank: 'Bradesco',
  number: 345678,
  supplier: booksgood
)

# Criação das partes dos livros dos fornecedores
booksgood.parts.create(
  title: 'capa dura',
  description: 'capa rígida do material x com espessura y'
)

booksgood.parts.create(
  title: 'folhas resistentes a agua',
  description: 'folhas que tem a espessura de x milimetros com resistência a agua'
)

sellbookcompany.parts.create(
  title: 'Folhas que brilham no escuro',
  description: 'Folhas que as crianças adoram, elas brilham na luz neon'
)

