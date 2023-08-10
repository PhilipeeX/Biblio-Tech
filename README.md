# BiblioTech

Bem-vindo ao BiblioTech, um projeto especial desenvolvido como parte das tarefas da mentoria Desenvolvendome! O objetivo deste projeto é proporcionar-me uma oportunidade prática de evoluir e aprimorar minhas habilidades em desenvolvimento web com Ruby on Rails.


## Funcionalidades Implementadas

[ ] **CRUDs**
- [x] Cadastrar Autores
- [x] Cadastrar Livros vinculando com Autor
- [x] Cadastrar Fornecedores com uma Conta
- [x] Cadastrar Peças vinculando com Fornecedor
- [ ] Cadastrar Montagens com várias Peças e vinculando com Livro

[ ] **APIs**
- [x] Cadastrar Autores
- [x] Cadastrar Livros vinculando com Autor
- [x] Cadastrar Fornecedores com uma Conta
- [x] Cadastrar Peças vinculando com Fornecedor
- [ ] Cadastrar Montagens com várias Peças e vinculando com Livro

[x] **Roles (Regras)**
- [x] Alterar
    - [x] Adicionar campo CNPJ em Fornecedor
    - [x] Adicionar campo Dígito Verificador em Conta
    - [x] Adicionar campo ISBN em Livro
    - [x] Adicionar campo CPF em Autor
- [x] Calcular
    - [x] Dígito Verificador em Conta (pesquisar como calcular esse dígito verificador)
- [x] Validar
    - [x] CNPJ em Fornecedor
    - [x] ISBN em Livro
    - [x] CPF em Autor

[ ] **Filtros**
- [ ] Adicionar
    - [ ] Campo título em Livro
    - [ ] Campo nome em Peça
- [ ] Filtrar
    - [ ] Fornecedor por nome
    - [ ] Fornecedor por número da conta em Conta
    - [ ] Livros por título
    - [ ] Livros por nome em Autor
    - [ ] Montagem por nome em Peça
    - [ ] Fornecedor por nome do Autor

[ ] **Relatórios**
- [ ] Adicionar
    - [ ] Campo valor em Peça
- [ ] Relatório
    - [ ] Autor (com todas as informações com seu Livros (com todas as informações) e o total de Livros publicado
    - [ ] Fornecedor (com todas as informações) com todos os autores (com todas as informações) e livros (com todas as informações)
    - [ ] Livro com a montagem (com todas as informações) com suas peças (com todas as informações), o total de peças e o custo total da montagem

## Configuração do Ambiente
- Ruby version: 3.1.2
- Rails version: 7.0.6
- Banco de Dados: PostgreSQL
- 1 Clone o repositório: git clone https://github.com/PhilipeeX/Biblio-Tech.git
- 2 Instale as dependências: bundle install
- 3 Crie e migre o banco de dados: rails db:create && rails db:migrate
- 4 Inicie o servidor: rails server

## Demonstração das requisições
Demonstração das Requisições
A seguir, um gif demonstrando as requisições feitas para todas as rotas da API utilizando o Insomnia:
![Gif demonstrando a API](https://github.com/PhilipeeX/Biblio-Tech/blob/release/v0.3.0/app/assets/images/Api-editora-de-livros-insomnia.gif)