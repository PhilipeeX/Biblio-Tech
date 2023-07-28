class BooksController < ApplicationController
  before_action :set_author

  # GET /books or /books.json
  def index
    @books = @author.books
  end

  # GET /books/1 or /books/1.json
  def show
    @book = @author.books.find(params[:id])
  end
  # GET /books/new
  def new
    @book = @author.books.build
  end

  # GET /books/1/edit


  # POST /books or /books.json
  def create
    @book = @author.books.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to author_book_url(@book.author_id, @book), notice: I18n.t('author.book.controller.create') }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @book = @author.books.find(params[:id])
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    @book = @author.books.find(params[:id])

    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to author_book_url, notice: I18n.t('author.book.controller.update') }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book = @author.books.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to author_books_url, notice: I18n.t('author.book.controller.destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:author_id])
    end
    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title)
    end
end
