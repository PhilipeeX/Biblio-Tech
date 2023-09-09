class AccountsController < ApplicationController
  before_action :set_supplier
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @supplier = Supplier.find(params[:supplier_id])
    @account = @supplier.build_account
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = @supplier.build_account(account_params)

    if @account.save
      redirect_to supplier_account_path(@supplier), notice: I18n.t('account.controller.create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    if @account.update(account_params)
      redirect_to supplier_account_path(@supplier), notice: I18n.t('account.controller.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy
    redirect_to supplier_url(@supplier), notice: I18n.t('account.controller.destroy')
  end

  private
  def set_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end

  def set_account
    @account = @supplier.account
  end

  def account_params
    params.require(:account).permit(:bank, :number, :digit)
  end
end
