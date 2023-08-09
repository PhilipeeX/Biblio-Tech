# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Criação dos authores
asimov = Author.create(name: 'Isaac Asimov', cpf: '658.945.940-14')
clarke = Author.create( name: 'Arthur C. Clarke', cpf: '394.457.350-13' )

# Livros escritos por Isaac Asimov
Book.create(
  title: 'Foundation',
  isbn: '978-1-63459-731-5',
  author: asimov
)
Book.create(
  title: 'Foundation and Empire',
  isbn: '978-1-63459-731-5',
  author: asimov
)
Book.create(
  title: 'Second Foundation',
  isbn: '978-1-63459-731-5',
  author: asimov
)
Book.create(
  title: 'I, Robot',
  isbn: '978-1-63459-731-5',
  author: asimov
)
Book.create(
  title: 'The Caves of Steel',
  isbn: '978-1-63459-731-5',
  author: asimov
)

# Livros escritos por Clarcke
Book.create(
  title: '2001: A Space Odyssey',
  isbn: '978-1-63459-731-5',
  author: clarke
)
Book.create(
  title: 'Rendezvous with Rama',
  isbn: '978-0-13-149505-0',
  author: clarke
)
Book.create(
  title: 'Childhood\'s End',
  isbn: '978-0-13-149505-0',
  author: clarke
)
Book.create(
  title: 'The Fountains of Paradise',
  isbn: '978-0-13-149505-0',
  author: clarke
)
Book.create(
  title: 'The City and the Stars',
  isbn: '978-0-13-149505-0',
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
  digit: '0',
  supplier: sellbookcompany
)

Account.create(
  bank: 'Itaú Unibanco',
  number: '261533',
  digit: '9',
  supplier: sellbookcompany
)

Account.create(
  bank: 'Bradesco',
  number: '987654',
  digit: '5',
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
