class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @author = Author.find(params[:author_id])
    @books = @author.books
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @author = Author.find(params[:author_id])
    @book = @author.books.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @author = Author.find(params[:author_id])
    @book = @author.books.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to author_book_url(@book.author_id, @book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    @author = Author.find(params[:author_id])


    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to author_book_url, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to author_books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title)
    end
end
