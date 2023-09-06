class PartsController < ApplicationController
  before_action :set_part, only: %i[ show edit update destroy ]

  def index
    @parts = Part.all
  end

  def show
  end

  def new
    @part = Part.new
  end

  def create
    @part = Part.new(part_params)

    if @part.save
      redirect_to @part, notice: I18n.t('supplier.part.controller.create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @part.update(part_params)
      redirect_to @part, notice: I18n.t('supplier.part.controller.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @part.destroy

    redirect_to parts_url, notice: I18n.t('supplier.part.controller.destroy')
  end

  private
  def set_part
    @part = Part.find(params[:id])
  end
  def part_params
    params.require(:part).permit(:title, :description, :supplier_id)
  end
end
