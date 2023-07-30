class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show edit update destroy ]
  def index
    @authors = Author.all
  end
  def show
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to author_url(@author), notice: I18n.t('author.controller.create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @author.update(author_params)
      redirect_to author_url(@author), notice: I18n.t('author.controller.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author.destroy

    redirect_to authors_url, notice: I18n.t('author.controller.destroy')
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name)
    end
end
