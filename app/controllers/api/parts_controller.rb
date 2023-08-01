class Api::PartsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_supplier

  def index
    @parts = @supplier.parts
    render json: @parts
  end

  def show
    @part = @supplier.parts.find(params[:id])
    render json: @part
  end

  def create
    @part = @supplier.parts.new(part_params)

    if @part.save
      render json: @part, status: :created
    else
      render json: @part.errors, status: :unprocessable_entity
    end
  end

  def update
    @part = @supplier.parts.find(params[:id])

    if @part.update(part_params)
      render json: @part
    else
      render json: @part.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @part = @supplier.parts.find(params[:id])
    @part.destroy

    head :no_content
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end

  def part_params
    params.require(:part).permit(:title, :description)
  end
end
