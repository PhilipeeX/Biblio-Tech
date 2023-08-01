class Api::SuppliersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @suppliers = Supplier.all
    render json: @suppliers
  end

  def show
    @supplier = Supplier.find(params[:id])
    render json: @supplier
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      render json: @supplier, status: :created
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  def update
    @supplier = Supplier.find(params[:id])

    if @supplier.update(supplier_params)
      render json: @supplier
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    head :no_content
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name)
  end
end