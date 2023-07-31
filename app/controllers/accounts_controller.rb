class AccountsController < ApplicationController
  before_action :set_supplier
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts or /accounts.json
  def index
    @supplier = Supplier.find(params[:supplier_id])
    @accounts = @supplier.accounts
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    @supplier = Supplier.find(params[:supplier_id])
  end

  # GET /accounts/new
  def new
    @account = @supplier.accounts.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = @supplier.accounts.new(account_params)

    if @account.save
      redirect_to supplier_account_url(@supplier,@account), notice: I18n.t('supplier.account.controller.create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    if @account.update(account_params)
      redirect_to supplier_account_url(@supplier,@account), notice: I18n.t('supplier.account.controller.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    redirect_to supplier_accounts_url, notice: I18n.t('supplier.account.controller.destroy')
  end

  private
  def set_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end
  def set_account
    @account = @supplier.accounts.find(params[:id])
  end
  def account_params
    params.require(:account).permit(:bank, :number)
  end
end
