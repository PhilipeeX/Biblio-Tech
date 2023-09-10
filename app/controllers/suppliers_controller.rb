class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[edit update destroy]

  def index
    if params[:filter_by] == 'name' && params[:query].present?
      @suppliers = Supplier.where('name ILIKE ?', "%#{params[:query]}%")
    elsif params[:filter_by] == 'account_number' && params[:query].present?
      @suppliers = Supplier.joins(:account).where('accounts.number ILIKE ?', "%#{params[:query]}%")
    elsif params[:filter_by] == 'author_name' && params[:query].present?
      @suppliers = Supplier.joins(parts: { assemblies: { book: :author } }).where('authors.name ILIKE ?', "%#{params[:query]}%").distinct
    else
      @suppliers = Supplier.all
    end
  end


  def show
    @supplier = Supplier.includes(:account).find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def edit; end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to supplier_url(@supplier), notice: I18n.t('supplier.controller.create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to supplier_url(@supplier), notice: I18n.t('supplier.controller.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @supplier.destroy

    redirect_to suppliers_url, notice: I18n.t('supplier.controller.destroy')
  end

  def relatorio
    @suppliers = Supplier.all
  end
  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:name, :cnpj)
  end
end
