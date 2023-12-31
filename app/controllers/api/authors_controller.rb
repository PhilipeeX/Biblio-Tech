# app/controllers/api/authors_controller.rb
class Api::AuthorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    authors = Author.all
    render json: authors, except: %i[created_at updated_at]
  end

  def show
    author = Author.find(params[:id])
    render json: author
  end

  def create
    author = Author.new(author_params)

    if author.save
      render json: author, status: :created, except: %i[created_at updated_at]
    else
      render json: { errors: author.errors }, status: :unprocessable_entity
    end
  end

  def update
    author = Author.find(params[:id])

    if author.update(author_params)
      render json: author, except: %i[created_at updated_at]
    else
      render json: { errors: author.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    head :no_content
  end

  private

  def author_params
    params.require(:author).permit(:name, :cpf)
  end
end
