class BooksController < ApplicationController
  def index
    if params[:query].present?
      if params[:search] == 'author'
        @books = Book.joins(:author).where('authors.name ILIKE ?', "%#{params[:query]}%")
      else
        @books = Book.where('title ILIKE ?', "%#{params[:query]}%")
      end
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: I18n.t('book.controller.create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book, notice: I18n.t('book.controller.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_url, notice: I18n.t('book.controller.destroy')
  end

  def relatorio
    @books = Book.all
  end

  private
  def book_params
    params.require(:book).permit(:title, :isbn, :author_id)
  end
end
