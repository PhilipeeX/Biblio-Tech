class BooksController < ApplicationController
  before_action :set_author

  def index
    if params[:title].present?
      @books = @author.books.where('title ILIKE ?', "%#{params[:title]}%")
    else
      @books = @author.books
    end
  end

  def show
    @book = @author.books.find(params[:id])
  end
  def new
    @book = @author.books.build
  end
  def create
    @book = @author.books.new(book_params)

    if @book.save
      redirect_to author_book_url(@book.author_id, @book), notice: I18n.t('author.book.controller.create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = @author.books.find(params[:id])
  end

  def update
    @book = @author.books.find(params[:id])

    if @book.update(book_params)
      redirect_to author_book_url, notice: I18n.t('author.book.controller.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = @author.books.find(params[:id])
    @book.destroy

    redirect_to author_books_url, notice: I18n.t('author.book.controller.destroy')
  end

  private
  def set_author
    @author = Author.find(params[:author_id])
  end
  def book_params
    params.require(:book).permit(:title, :isbn)
  end
end
