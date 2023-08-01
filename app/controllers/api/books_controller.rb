class Api::BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_author
  def index
    @books = @author.books
    render json: @books
  end

  def show
    @book = @author.books.find(params[:id])
    render json: @book
  end

  def create
    @book = @author.books.new(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    @book = @author.books.find(params[:id])

    if @book.update(book_params)
      render json: @book
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

  def set_author
    @author = Author.find(params[:author_id])
  end

  def book_params
    params.require(:book).permit(:title)
  end
end
