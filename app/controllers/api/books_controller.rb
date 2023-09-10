class Api::BooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @books = Book.all.includes(:author)
    books_data = @books.map do |book|
      {
        id: book.id,
        nome_do_autor: book.author.name,
        title: book.title,
        isbn: book.isbn,
        montagem: book.assembly.name
      }
    end
    render json: books_data
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, except: [:updated_at, :created_at]
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      render json: @book, except: [:updated_at, :created_at]
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    head :no_content
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :author_id, :assembly_id)
  end
end
