
# Criação dos autores
asimov = Author.create(name: 'Isaac Asimov', cpf: '658.945.940-14')
clarke = Author.create(name: 'Arthur C. Clarke', cpf: '394.457.350-13')
gibson = Author.create(name: 'William Gibson', cpf: '964.864.390-33')
howey = Author.create(name: 'Hugh Howey', cpf: '940.258.540-07')

# Definindo uma lista de ISBNs válidos
valid_isbns = [
  '9780470059029',
  '0836218833',
  '0061122416',
  '0385504209',
  '0451450523',
  '0142000671',
  '0316769487',
  '9783161484100',
  '9783161484117',
  '9783161484124'
]

# Livros escritos por Isaac Asimov
Book.create(title: 'Foundation', isbn: valid_isbns.sample, author: asimov)
Book.create(title: 'Foundation and Empire', isbn: valid_isbns.sample, author: asimov)
Book.create(title: 'Second Foundation', isbn: valid_isbns.sample, author: asimov)
Book.create(title: 'I, Robot', isbn: valid_isbns.sample, author: asimov)
Book.create(title: 'The Caves of Steel', isbn: valid_isbns.sample, author: asimov)

# Livros escritos por Arthur C. Clarke
Book.create(title: '2001: A Space Odyssey', isbn: valid_isbns.sample, author: clarke)
Book.create(title: 'Rendezvous with Rama', isbn: valid_isbns.sample, author: clarke)
Book.create(title: 'Childhood\'s End', isbn: valid_isbns.sample, author: clarke)
Book.create(title: 'The Fountains of Paradise', isbn: valid_isbns.sample, author: clarke)
Book.create(title: 'The City and the Stars', isbn: valid_isbns.sample, author: clarke)

# Livros escritos por William Gibson
Book.create(title: 'Neuromancer', isbn: valid_isbns.sample, author: gibson)
Book.create(title: 'Count Zero', isbn: valid_isbns.sample, author: gibson)
Book.create(title: 'Mona Lisa Overdrive', isbn: valid_isbns.sample, author: gibson)
Book.create(title: 'Pattern Recognition', isbn: valid_isbns.sample, author: gibson)
Book.create(title: 'The Peripheral', isbn: valid_isbns.sample, author: gibson)

# Livros escritos por Hugh Howey
Book.create(title: 'Wool', isbn: valid_isbns.sample, author: howey)
Book.create(title: 'Shift', isbn: valid_isbns.sample, author: howey)
Book.create(title: 'Dust', isbn: valid_isbns.sample, author: howey)
Book.create(title: 'Beacon 23', isbn: valid_isbns.sample, author: howey)
Book.create(title: 'Silo', isbn: valid_isbns.sample, author: howey)


# Criação dos fornecedores
booksgood = Supplier.create(name: 'booksgood', cnpj: Faker::Company.brazilian_company_number.to_s)
sellbookcompany = Supplier.create(name: 'SellBook Company', cnpj: Faker::Company.brazilian_company_number.to_s)

# Criação das contas dos fornecedores
Account.create(bank: 'Banco do Brasil', number: '123456', digit: '0', supplier: sellbookcompany)
Account.create(bank: 'Bradesco', number: '987654', digit: '5', supplier: booksgood)

# Criação das montagens
assembly1 = Assembly.create(name: 'Montagem de Capa Dura')
assembly2 = Assembly.create(name: 'Montagem de Livro de Bolso')
assembly3 = Assembly.create(name: 'Montagem de Livro Infantil')

# Criação das peças
part1 = Part.create(title: 'Capa Dura', description: 'Capa rígida feita de material resistente', supplier: booksgood)
part2 = Part.create(title: 'Folhas de Papel', description: 'Folhas de papel reciclado de 80g/m2', supplier: sellbookcompany)
part3 = Part.create(title: 'Folhas Coloridas', description: 'Folhas de papel colorido de 80g/m2', supplier: booksgood)

# Associação das peças com as montagens
assembly1.parts << part1
assembly1.parts << part2
assembly2.parts << part2
assembly3.parts << part2
assembly3.parts << part3
