class Api::AccountsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @accounts = Account.select('accounts.*, suppliers.name as supplier_name').joins(:supplier)
    render json: @accounts
  end

  def show
    @account = @supplier.account
    render json: @account
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      render json: @account, status: :created
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def update
    @account = @supplier.account

    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @account = @supplier.account
    @account.destroy

    head :no_content
  end

  private

  def account_params
    params.require(:account).permit(:supplier_id, :bank, :number, :digit)
  end
end
