class Api::SuppliersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @suppliers = Supplier.all
    render json: @suppliers, except: %i[created_at updated_at]
  end

  def show
    @supplier = Supplier.find(params[:id])
    render json: @supplier.as_json(include: { account: { only: %i[bank number digit] } }, except: %i[created_at updated_at])
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
      render json: @supplier, except: %i[created_at updated_at]
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
    params.require(:supplier).permit(:name, :cnpj)
  end
end
