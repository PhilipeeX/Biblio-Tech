# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Criação dos authores
asimov = Author.create(name: 'Isaac Asimov')
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
  name: 'booksgood',
  cnpj: Faker::Company.brazilian_company_number.to_s
)

sellbookcompany = Supplier.create(
  name: 'SellBook Company',
  cnpj: Faker::Company.brazilian_company_number.to_s
)

# Criação das contas dos fornecedores
Account.create(
  bank: 'Banco do Brasil',
  number: '123456',
  supplier: sellbookcompany
)

Account.create(
  bank: 'Itaú Unibanco',
  number: '789012',
  supplier: sellbookcompany
)

Account.create(
  bank: 'Bradesco',
  number: '345678',
  supplier: booksgood
)

# Criação das peças dos fornecedores
Part.create(
  title: 'capa dura',
  description: 'capa rígida do material x com espessura y',
  supplier: booksgood
)

Part.create(
  title: 'folhas resistentes a agua',
  description: 'folhas que tem a espessura de x milimetros com resistência a agua',
  supplier: sellbookcompany
)

Part.create(
  title: 'Folhas que brilham no escuro',
  description: 'Folhas que as crianças adoram, elas brilham na luz neon',
  supplier: sellbookcompany
)
Part.create(
  title: 'capa com relevo',
  description: 'capa do material x com relevo personalizado',
  supplier: booksgood
)

Part.create(
  title: 'folhas coloridas',
  description: 'folhas com cores vibrantes para tornar a leitura mais divertida',
  supplier: booksgood
)

Part.create(
  title: 'marcadores de página',
  description: 'marcadores de página personalizados e coloridos',
  supplier: sellbookcompany
)
