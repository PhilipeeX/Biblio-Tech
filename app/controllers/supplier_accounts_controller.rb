class SupplierAccountsController < ApplicationController
  before_action :set_supplier_account, only: %i[ show edit update destroy ]

  # GET /supplier_accounts or /supplier_accounts.json
  def index
    @supplier_accounts = SupplierAccount.all
  end

  # GET /supplier_accounts/1 or /supplier_accounts/1.json
  def show
  end

  # GET /supplier_accounts/new
  def new
    @supplier_account = SupplierAccount.new
  end

  # GET /supplier_accounts/1/edit
  def edit
  end

  # POST /supplier_accounts or /supplier_accounts.json
  def create
    @supplier_account = SupplierAccount.new(supplier_account_params)

    respond_to do |format|
      if @supplier_account.save
        format.html { redirect_to supplier_account_url(@supplier_account), notice: "Supplier account was successfully created." }
        format.json { render :show, status: :created, location: @supplier_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplier_accounts/1 or /supplier_accounts/1.json
  def update
    respond_to do |format|
      if @supplier_account.update(supplier_account_params)
        format.html { redirect_to supplier_account_url(@supplier_account), notice: "Supplier account was successfully updated." }
        format.json { render :show, status: :ok, location: @supplier_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplier_accounts/1 or /supplier_accounts/1.json
  def destroy
    @supplier_account.destroy

    respond_to do |format|
      format.html { redirect_to supplier_accounts_url, notice: "Supplier account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier_account
      @supplier_account = SupplierAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supplier_account_params
      params.require(:supplier_account).permit(:account, :supplier_id)
    end
end
