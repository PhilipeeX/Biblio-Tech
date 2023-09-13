# BiblioTech

Bem-vindo ao BiblioTech, um projeto especial desenvolvido como parte das tarefas da mentoria Desenvolvendome! O objetivo deste projeto é proporcionar-me uma oportunidade prática de evoluir e aprimorar minhas habilidades em desenvolvimento web com Ruby on Rails.


## Funcionalidades Implementadas

[ ] **CRUDs**
- [x] Cadastrar Autores
- [x] Cadastrar Livros vinculando com Autor
- [x] Cadastrar Fornecedores com uma Conta
- [x] Cadastrar Peças vinculando com Fornecedor
- [x] Cadastrar Montagens com várias Peças e vinculando com Livro

[x] **APIs**
- [x] Cadastrar Autores
- [x] Cadastrar Livros vinculando com Autor
- [x] Cadastrar Fornecedores com uma Conta
- [x] Cadastrar Peças vinculando com Fornecedor
- [x] Cadastrar Montagens com várias Peças e vinculando com Livro

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

[x] **Filtros**
- [x] Adicionar
    - [x] Campo título em Livro
    - [x] Campo nome em Peça
- [x] Filtrar
    - [x] Fornecedor por nome
    - [x] Fornecedor por número da conta em Conta
    - [x] Livros por título
    - [x] Livros por nome em Autor
    - [x] Montagem por nome em Peça
    - [x] Fornecedor por nome do Autor

[x] **Relatórios**
- [x] Adicionar
    - [x] Campo valor em Peça
- [x] Relatório
    - [x] Autor (com todas as informações com seu Livros (com todas as informações) e o total de Livros publicado
    - [x] Fornecedor (com todas as informações) com todos os autores (com todas as informações) e livros (com todas as informações)
    - [x] Livro com a montagem (com todas as informações) com suas peças (com todas as informações), o total de peças e o custo total da montagem

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
![Gif demonstrando a API](https://github.com/PhilipeeX/Biblio-Tech/assets/85847179/5f5f0d65-956b-4d77-acfc-163bd5d02748)