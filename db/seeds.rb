
# Criação dos autores
asimov = Author.create(name: 'Isaac Asimov', cpf: '658.945.940-14')
clarke = Author.create(name: 'Arthur C. Clarke', cpf: '394.457.350-13')
gibson = Author.create(name: 'William Gibson', cpf: '964.864.390-33')
howey = Author.create(name: 'Hugh Howey', cpf: '940.258.540-07')
herbert = Author.create(name: 'Frank Herbert', cpf: '752.727.750-58')
bradbury = Author.create(name: 'Ray Bradbury', cpf: '241.776.870-49')
orwell = Author.create(name: 'George Orwell', cpf: '544.963.410-26')
huxley = Author.create(name: 'Aldous Huxley', cpf: '421.607.640-86')
dick = Author.create(name: 'Philip K. Dick', cpf: '756.196.160-02')
verne = Author.create(name: 'Jules Verne', cpf: '902.483.450-36')
wells = Author.create(name: 'H.G. Wells', cpf: '237.531.920-66')

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

# Criação das montagens
assembly1 = Assembly.create(name: 'Montagem de Capa Dura')
assembly2 = Assembly.create(name: 'Montagem de Livro de Bolso')
assembly3 = Assembly.create(name: 'Montagem de Livro Infantil')

# Livros escritos por Isaac Asimov
Book.create(title: 'Foundation', isbn: valid_isbns.sample, assembly: assembly1, author: asimov)
Book.create(title: 'Foundation and Empire', isbn: valid_isbns.sample, assembly: assembly1, author: asimov)
Book.create(title: 'Second Foundation', isbn: valid_isbns.sample, assembly: assembly1, author: asimov)
Book.create(title: 'I, Robot', isbn: valid_isbns.sample, assembly: assembly1, author: asimov)
Book.create(title: 'The Caves of Steel', isbn: valid_isbns.sample, assembly: assembly1, author: asimov)

# Livros escritos por Arthur C. Clarke
Book.create(title: '2001: A Space Odyssey', isbn: valid_isbns.sample, assembly: assembly1, author: clarke)
Book.create(title: 'Rendezvous with Rama', isbn: valid_isbns.sample, assembly: assembly1, author: clarke)
Book.create(title: 'Childhood\'s End', isbn: valid_isbns.sample, assembly: assembly1, author: clarke)
Book.create(title: 'The Fountains of Paradise', isbn: valid_isbns.sample, assembly: assembly1, author: clarke)
Book.create(title: 'The City and the Stars', isbn: valid_isbns.sample, assembly: assembly1, author: clarke)

# Livros escritos por William Gibson
Book.create(title: 'Neuromancer', isbn: valid_isbns.sample, assembly: assembly1, author: gibson)
Book.create(title: 'Count Zero', isbn: valid_isbns.sample, assembly: assembly1, author: gibson)
Book.create(title: 'Mona Lisa Overdrive', isbn: valid_isbns.sample, assembly: assembly1, author: gibson)
Book.create(title: 'Pattern Recognition', isbn: valid_isbns.sample, assembly: assembly1, author: gibson)
Book.create(title: 'The Peripheral', isbn: valid_isbns.sample, assembly: assembly1, author: gibson)

# Livros escritos por Hugh Howey
Book.create(title: 'Wool', isbn: valid_isbns.sample, assembly: assembly1, author: howey)
Book.create(title: 'Shift', isbn: valid_isbns.sample, assembly: assembly1, author: howey)
Book.create(title: 'Dust', isbn: valid_isbns.sample, assembly: assembly1, author: howey)
Book.create(title: 'Beacon 23', isbn: valid_isbns.sample, assembly: assembly1, author: howey)
Book.create(title: 'Silo', isbn: valid_isbns.sample, assembly: assembly1, author: howey)

# Livros escritos por Frank Herbert
Book.create(title: 'Dune', isbn: valid_isbns.sample, assembly: assembly2, author: herbert)
Book.create(title: 'Dune Messiah', isbn: valid_isbns.sample, assembly: assembly2, author: herbert)
Book.create(title: 'Children of Dune', isbn: valid_isbns.sample, assembly: assembly2, author: herbert)
Book.create(title: 'God Emperor of Dune', isbn: valid_isbns.sample, assembly: assembly2, author: herbert)
Book.create(title: 'Heretics of Dune', isbn: valid_isbns.sample, assembly: assembly2, author: herbert)

# Livros escritos por Ray Bradbury
Book.create(title: 'Fahrenheit 451', isbn: valid_isbns.sample, assembly: assembly2, author: bradbury)
Book.create(title: 'The Martian Chronicles', isbn: valid_isbns.sample, assembly: assembly2, author: bradbury)
Book.create(title: 'Something Wicked This Way Comes', isbn: valid_isbns.sample, assembly: assembly2, author: bradbury)
Book.create(title: 'Dandelion Wine', isbn: valid_isbns.sample, assembly: assembly2, author: bradbury)
Book.create(title: 'The Illustrated Man', isbn: valid_isbns.sample, assembly: assembly2, author: bradbury)

# Livros escritos por George Orwell
Book.create(title: '1984', isbn: valid_isbns.sample, assembly: assembly2, author: orwell)
Book.create(title: 'Animal Farm', isbn: valid_isbns.sample, assembly: assembly2, author: orwell)
Book.create(title: 'Homage to Catalonia', isbn: valid_isbns.sample, assembly: assembly2, author: orwell)
Book.create(title: 'Down and Out in Paris and London', isbn: valid_isbns.sample, assembly: assembly2, author: orwell)
Book.create(title: 'The Road to Wigan Pier', isbn: valid_isbns.sample, assembly: assembly2, author: orwell)

# Livros escritos por Aldous Huxley
Book.create(title: 'Brave New World', isbn: valid_isbns.sample, assembly: assembly3, author: huxley)
Book.create(title: 'The Doors of Perception', isbn: valid_isbns.sample, assembly: assembly3, author: huxley)
Book.create(title: 'Island', isbn: valid_isbns.sample, assembly: assembly3, author: huxley)
Book.create(title: 'Ape and Essence', isbn: valid_isbns.sample, assembly: assembly3, author: huxley)
Book.create(title: 'Point Counter Point', isbn: valid_isbns.sample, assembly: assembly3, author: huxley)

# Livros escritos por Philip K. Dick
Book.create(title: 'Do Androids Dream of Electric Sheep?', isbn: valid_isbns.sample, assembly: assembly3, author: dick)
Book.create(title: 'The Man in the High Castle', isbn: valid_isbns.sample, assembly: assembly3, author: dick)
Book.create(title: 'Ubik', isbn: valid_isbns.sample, assembly: assembly3, author: dick)
Book.create(title: 'A Scanner Darkly', isbn: valid_isbns.sample, assembly: assembly3, author: dick)
Book.create(title: 'Flow My Tears, the Policeman Said', isbn: valid_isbns.sample, assembly: assembly3, author: dick)

# Livros escritos por Jules Verne
Book.create(title: 'Twenty Thousand Leagues Under the Sea', isbn: valid_isbns.sample, assembly: assembly3, author: verne)
Book.create(title: 'Journey to the Center of the Earth', isbn: valid_isbns.sample, assembly: assembly3, author: verne)
Book.create(title: 'Around the World in Eighty Days', isbn: valid_isbns.sample, assembly: assembly3, author: verne)
Book.create(title: 'The Mysterious Island', isbn: valid_isbns.sample, assembly: assembly3, author: verne)
Book.create(title: 'From the Earth to the Moon', isbn: valid_isbns.sample, assembly: assembly3, author: verne)

# Livros escritos por H.G. Wells
Book.create(title: 'The War of the Worlds', isbn: valid_isbns.sample, assembly: assembly3, author: wells)
Book.create(title: 'The Time Machine', isbn: valid_isbns.sample, assembly: assembly3, author: wells)
Book.create(title: 'The Invisible Man', isbn: valid_isbns.sample, assembly: assembly3, author: wells)
Book.create(title: 'The Island of Doctor Moreau', isbn: valid_isbns.sample, assembly: assembly3, author: wells)
Book.create(title: 'The First Men in the Moon', isbn: valid_isbns.sample, assembly: assembly3, author: wells)


# Criação dos fornecedores
booksgood = Supplier.create(name: 'booksgood', cnpj: Faker::Company.brazilian_company_number(formatted: true))
sellbookcompany = Supplier.create(name: 'SellBook Company', cnpj: Faker::Company.brazilian_company_number(formatted: true))

# Criação das contas dos fornecedores
Account.create(bank: 'Banco do Brasil', number: '123456', digit: '0', supplier: sellbookcompany)
Account.create(bank: 'Bradesco', number: '987654', digit: '5', supplier: booksgood)

# Criação das peças
part1 = Part.create(title: 'Capa Dura', description: 'Capa rígida feita de material resistente',part_number: '4267', price: 25.90, supplier: booksgood)
part2 = Part.create(title: 'Folhas de Papel', description: 'Folhas de papel reciclado de 80g/m2',part_number: '9261', price: 90.00, supplier: sellbookcompany)
part3 = Part.create(title: 'Folhas Coloridas', description: 'Folhas de papel colorido de 80g/m2',part_number: '0577', price: 122.50, supplier: booksgood)

# Associação das peças com as montagens
assembly1.parts << part1
assembly1.parts << part2
assembly2.parts << part2
assembly3.parts << part2
assembly3.parts << part3
