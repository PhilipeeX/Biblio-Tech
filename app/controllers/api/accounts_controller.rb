class Api::AccountsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_supplier

  def index
    @accounts = @supplier.accounts
    render json: @accounts
  end

  def show
    @account = @supplier.accounts.find(params[:id])
    render json: @account
  end

  def create
    @account = @supplier.accounts.new(account_params)

    if @account.save
      render json: @account, status: :created
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def update
    @account = @supplier.accounts.find(params[:id])

    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @account = @supplier.accounts.find(params[:id])
    @account.destroy

    head :no_content
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end

  def account_params
    params.require(:account).permit(:bank, :number, :digit)
  end
end
