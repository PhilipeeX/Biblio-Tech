class PartsController < ApplicationController
  before_action :set_supplier
  before_action :set_part, only: %i[ show edit update destroy ]

  def index
    @parts = @supplier.parts
  end

  def show
  end

  def new
    @part = @supplier.parts.new
  end
  def create
    @part = @supplier.parts.new(part_params)

    if @part.save
      redirect_to supplier_part_url(@supplier,@part), notice: I18n.t('supplier.part.controller.create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @part.update(part_params)
      redirect_to supplier_part_url(@supplier,@part), notice: I18n.t('supplier.part.controller.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @part.destroy

    redirect_to supplier_parts_url, notice: I18n.t('supplier.part.controller.destroy')
  end

  private
  def set_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end
  def set_part
    @part = @supplier.parts.find(params[:id])
  end
  def part_params
    params.require(:part).permit(:title, :description)
  end
end
