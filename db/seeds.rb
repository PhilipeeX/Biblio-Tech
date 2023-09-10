
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
edicao_padrao = Assembly.create(name: 'Edição Padrão')
edicao_capa_dura_classica = Assembly.create(name: 'Capa Dura Clássica')
edicao_premium = Assembly.create(name: 'Edição Premium')
edicao_capa_personalizada = Assembly.create(name: 'Montagem de Capa Personalizada')
livro_de_bolso = Assembly.create(name: 'Livro de Bolso')
edicao_de_colecionador = Assembly.create(name: 'Edição de Colecionador')
montagem_de_folhas_resistentes = Assembly.create(name: 'Montagem de Folhas Resistentes')
edicao_capa_de_tecido = Assembly.create(name: 'Capa de Tecido')
edicao_limitada = Assembly.create(name: 'Edição Limitada')
edicao_de_luxo = Assembly.create(name: 'Edição de Luxo')

assemblies = [
  edicao_padrao,
  edicao_capa_dura_classica,
  edicao_premium,
  edicao_capa_personalizada,
  livro_de_bolso,
  edicao_de_colecionador,
  montagem_de_folhas_resistentes,
  edicao_capa_de_tecido,
  edicao_limitada,
  edicao_de_luxo
]

# Livros escritos por Isaac Asimov
Book.create(title: 'Foundation', isbn: valid_isbns.sample, assembly: assemblies.sample, author: asimov)
Book.create(title: 'Foundation and Empire', isbn: valid_isbns.sample, assembly: assemblies.sample, author: asimov)
Book.create(title: 'Second Foundation', isbn: valid_isbns.sample, assembly: assemblies.sample, author: asimov)
Book.create(title: 'I, Robot', isbn: valid_isbns.sample, assembly: assemblies.sample, author: asimov)
Book.create(title: 'The Caves of Steel', isbn: valid_isbns.sample, assembly: assemblies.sample, author: asimov)

# Livros escritos por Arthur C. Clarke
Book.create(title: '2001: A Space Odyssey', isbn: valid_isbns.sample, assembly: assemblies.sample, author: clarke)
Book.create(title: 'Rendezvous with Rama', isbn: valid_isbns.sample, assembly: assemblies.sample, author: clarke)
Book.create(title: 'Childhood\'s End', isbn: valid_isbns.sample, assembly: assemblies.sample, author: clarke)
Book.create(title: 'The Fountains of Paradise', isbn: valid_isbns.sample, assembly: assemblies.sample, author: clarke)
Book.create(title: 'The City and the Stars', isbn: valid_isbns.sample, assembly: assemblies.sample, author: clarke)

# Livros escritos por William Gibson
Book.create(title: 'Neuromancer', isbn: valid_isbns.sample, assembly: assemblies.sample, author: gibson)
Book.create(title: 'Count Zero', isbn: valid_isbns.sample, assembly: assemblies.sample, author: gibson)
Book.create(title: 'Mona Lisa Overdrive', isbn: valid_isbns.sample, assembly: assemblies.sample, author: gibson)
Book.create(title: 'Pattern Recognition', isbn: valid_isbns.sample, assembly: assemblies.sample, author: gibson)
Book.create(title: 'The Peripheral', isbn: valid_isbns.sample, assembly: assemblies.sample, author: gibson)

# Livros escritos por Hugh Howey
Book.create(title: 'Wool', isbn: valid_isbns.sample, assembly: assemblies.sample, author: howey)
Book.create(title: 'Shift', isbn: valid_isbns.sample, assembly: assemblies.sample, author: howey)
Book.create(title: 'Dust', isbn: valid_isbns.sample, assembly: assemblies.sample, author: howey)
Book.create(title: 'Beacon 23', isbn: valid_isbns.sample, assembly: assemblies.sample, author: howey)
Book.create(title: 'Silo', isbn: valid_isbns.sample, assembly: assemblies.sample, author: howey)

# Livros escritos por Frank Herbert
Book.create(title: 'Dune', isbn: valid_isbns.sample, assembly: assemblies.sample, author: herbert)
Book.create(title: 'Dune Messiah', isbn: valid_isbns.sample, assembly: assemblies.sample, author: herbert)
Book.create(title: 'Children of Dune', isbn: valid_isbns.sample, assembly: assemblies.sample, author: herbert)
Book.create(title: 'God Emperor of Dune', isbn: valid_isbns.sample, assembly: assemblies.sample, author: herbert)
Book.create(title: 'Heretics of Dune', isbn: valid_isbns.sample, assembly: assemblies.sample, author: herbert)

# Livros escritos por Ray Bradbury
Book.create(title: 'Fahrenheit 451', isbn: valid_isbns.sample, assembly: assemblies.sample, author: bradbury)
Book.create(title: 'The Martian Chronicles', isbn: valid_isbns.sample, assembly: assemblies.sample, author: bradbury)
Book.create(title: 'Something Wicked This Way Comes', isbn: valid_isbns.sample, assembly: assemblies.sample, author: bradbury)
Book.create(title: 'Dandelion Wine', isbn: valid_isbns.sample, assembly: assemblies.sample, author: bradbury)
Book.create(title: 'The Illustrated Man', isbn: valid_isbns.sample, assembly: assemblies.sample, author: bradbury)

# Livros escritos por George Orwell
Book.create(title: '1984', isbn: valid_isbns.sample, assembly: assemblies.sample, author: orwell)
Book.create(title: 'Animal Farm', isbn: valid_isbns.sample, assembly: assemblies.sample, author: orwell)
Book.create(title: 'Homage to Catalonia', isbn: valid_isbns.sample, assembly: assemblies.sample, author: orwell)
Book.create(title: 'Down and Out in Paris and London', isbn: valid_isbns.sample, assembly: assemblies.sample, author: orwell)
Book.create(title: 'The Road to Wigan Pier', isbn: valid_isbns.sample, assembly: assemblies.sample, author: orwell)

# Livros escritos por Aldous Huxley
Book.create(title: 'Brave New World', isbn: valid_isbns.sample, assembly: assemblies.sample, author: huxley)
Book.create(title: 'The Doors of Perception', isbn: valid_isbns.sample, assembly: assemblies.sample, author: huxley)
Book.create(title: 'Island', isbn: valid_isbns.sample, assembly: assemblies.sample, author: huxley)
Book.create(title: 'Ape and Essence', isbn: valid_isbns.sample, assembly: assemblies.sample, author: huxley)
Book.create(title: 'Point Counter Point', isbn: valid_isbns.sample, assembly: assemblies.sample, author: huxley)

# Livros escritos por Philip K. Dick
Book.create(title: 'Do Androids Dream of Electric Sheep?', isbn: valid_isbns.sample, assembly: assemblies.sample, author: dick)
Book.create(title: 'The Man in the High Castle', isbn: valid_isbns.sample, assembly: assemblies.sample, author: dick)
Book.create(title: 'Ubik', isbn: valid_isbns.sample, assembly: assemblies.sample, author: dick)
Book.create(title: 'A Scanner Darkly', isbn: valid_isbns.sample, assembly: assemblies.sample, author: dick)
Book.create(title: 'Flow My Tears, the Policeman Said', isbn: valid_isbns.sample, assembly: assemblies.sample, author: dick)

# Livros escritos por Jules Verne
Book.create(title: 'Twenty Thousand Leagues Under the Sea', isbn: valid_isbns.sample, assembly: assemblies.sample, author: verne)
Book.create(title: 'Journey to the Center of the Earth', isbn: valid_isbns.sample, assembly: assemblies.sample, author: verne)
Book.create(title: 'Around the World in Eighty Days', isbn: valid_isbns.sample, assembly: assemblies.sample, author: verne)
Book.create(title: 'The Mysterious Island', isbn: valid_isbns.sample, assembly: assemblies.sample, author: verne)
Book.create(title: 'From the Earth to the Moon', isbn: valid_isbns.sample, assembly: assemblies.sample, author: verne)

# Livros escritos por H.G. Wells
Book.create(title: 'The War of the Worlds', isbn: valid_isbns.sample, assembly: assemblies.sample, author: wells)
Book.create(title: 'The Time Machine', isbn: valid_isbns.sample, assembly: assemblies.sample, author: wells)
Book.create(title: 'The Invisible Man', isbn: valid_isbns.sample, assembly: assemblies.sample, author: wells)
Book.create(title: 'The Island of Doctor Moreau', isbn: valid_isbns.sample, assembly: assemblies.sample, author: wells)
Book.create(title: 'The First Men in the Moon', isbn: valid_isbns.sample, assembly: assemblies.sample, author: wells)


# Criação dos fornecedores
booksgood = Supplier.create(name: 'booksgood', cnpj: Faker::Company.brazilian_company_number(formatted: true))
sellbookcompany = Supplier.create(name: 'SellBook Company', cnpj: Faker::Company.brazilian_company_number(formatted: true))
bookheaven = Supplier.create(name: 'BookHeaven Inc.', cnpj: Faker::Company.brazilian_company_number(formatted: true))
papercrafters = Supplier.create(name: 'PaperCrafters Ltd.', cnpj: Faker::Company.brazilian_company_number(formatted: true))


# Criação das contas dos fornecedores
Account.create(bank: 'Banco do Brasil', number: '123456', digit: '0', supplier: sellbookcompany)
Account.create(bank: 'Bradesco', number: '987654', digit: '5', supplier: booksgood)
Account.create(bank: 'Nubank', number: '123456', digit: '0', supplier: bookheaven)

# Criação das peças
capa_dura_padrao = Part.create(title: 'Capa Dura Padrão', description: 'Capa dura padrão feita de material resistente', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 2..99), supplier: booksgood)
papel_padrao = Part.create(title: 'Papel  Padrão', description: 'Folhas de papel de 80g/m2 padrão', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 2..99), supplier: sellbookcompany)
guardas = Part.create(title: 'Guardas', description: 'Guardas de papel para proteção', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 2..99), supplier: bookheaven)
lombada = Part.create(title: 'Lombada', description: 'Lombada de papelão', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 2..99), supplier: papercrafters)
ilustracoes = Part.create(title: 'Ilustrações', description: 'Ilustrações e gráficos impressos em papel de alta qualidade', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 2..99), supplier: booksgood)
capa_dura_classica = Part.create(title: 'Capa Dura clássica', description: 'Capa dura clássica feita de material antiquário', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 2..99), supplier: sellbookcompany)
capa_dura_premium = Part.create(title: 'Capa Dura Premium', description: 'Capa dura premium feita de material luxuoso', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 10..99), supplier: bookheaven)
folhas_de_alta_qualidade = Part.create(title: 'Folhas de Alta Qualidade', description: 'Folhas de papel de alta qualidade de 100g/m2', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 10..99), supplier: papercrafters)
marcador_de_pagina = Part.create(title: 'Marcador de Página', description: 'Marcador de página em seda com detalhes refinados', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 2..9), supplier: booksgood)
caixa_de_apresentacao = Part.create(title: 'Caixa de Apresentação', description: 'Caixa de apresentação personalizada com acabamento premium', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 20..49), supplier: sellbookcompany)
capa_personalizada = Part.create(title: 'Capa Personalizada', description: 'Capa personalizada feita sob medida de acordo com as preferências do cliente', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 10..199), supplier: bookheaven)
folhas_resistentes = Part.create(title: 'Folhas Resistentes', description: 'Folhas de papel resistentes e duráveis de 120g/m2', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 10..99), supplier: papercrafters)
capa_de_tecido = Part.create(title: 'Capa de Tecido', description: 'Capa de tecido resistente e elegante', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 10..99), supplier: booksgood)
capa_de_luxo = Part.create(title: 'Capa de Luxo', description: 'Capa de luxo feita com materiais premium', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 100..9999), supplier: sellbookcompany)
folhas_de_luxo = Part.create(title: 'Folhas de Luxo', description: 'Folhas de papel de luxo de alta gramatura', part_number: rand(1000..9999), price: Faker::Commerce.price(range: 100..9999), supplier: bookheaven)


# Associações entre peças e montagens
edicao_padrao.parts << capa_dura_padrao
edicao_padrao.parts << papel_padrao

edicao_capa_dura_classica.parts << capa_dura_classica
edicao_capa_dura_classica.parts << papel_padrao
edicao_capa_dura_classica.parts << guardas

edicao_premium.parts << capa_dura_premium
edicao_premium.parts << folhas_de_alta_qualidade
edicao_premium.parts << ilustracoes
edicao_premium.parts << marcador_de_pagina
edicao_premium.parts << caixa_de_apresentacao

edicao_capa_personalizada.parts << capa_personalizada
edicao_capa_personalizada.parts << papel_padrao
edicao_capa_personalizada.parts << lombada

livro_de_bolso.parts << capa_dura_padrao
livro_de_bolso.parts << papel_padrao

edicao_de_colecionador.parts << capa_dura_premium
edicao_de_colecionador.parts << folhas_de_alta_qualidade
edicao_de_colecionador.parts << guardas
edicao_de_colecionador.parts << lombada
edicao_de_colecionador.parts << ilustracoes
edicao_de_colecionador.parts << marcador_de_pagina
edicao_de_colecionador.parts << caixa_de_apresentacao

montagem_de_folhas_resistentes.parts << capa_dura_padrao
montagem_de_folhas_resistentes.parts << folhas_resistentes

edicao_capa_de_tecido.parts << capa_de_tecido
edicao_capa_de_tecido.parts << papel_padrao
edicao_capa_de_tecido.parts << guardas

edicao_limitada.parts << capa_dura_premium
edicao_limitada.parts << folhas_de_alta_qualidade
edicao_limitada.parts << caixa_de_apresentacao

edicao_de_luxo.parts << capa_de_luxo
edicao_de_luxo.parts << folhas_de_luxo
edicao_de_luxo.parts << ilustracoes
edicao_de_luxo.parts << marcador_de_pagina
edicao_de_luxo.parts << caixa_de_apresentacao


