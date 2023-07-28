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

    respond_to do |format|
      if @account.save
        format.html { redirect_to supplier_account_url(@supplier,@account), notice: I18n.t('supplier.account.controller.create') }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to supplier_account_url(@supplier,@account), notice: I18n.t('supplier.account.controller.update') }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to supplier_accounts_url, notice: I18n.t('supplier.account.controller.destroy') }
      format.json { head :no_content }
    end
  end

  private
  def set_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = @supplier.accounts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:bank, :number)
    end
end
