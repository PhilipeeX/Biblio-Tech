class PartsController < ApplicationController
  before_action :set_supplier
  before_action :set_part, only: %i[ show edit update destroy ]

  # GET /parts or /parts.json
  def index
    @parts = @supplier.parts
  end

  # GET /parts/1 or /parts/1.json
  def show
  end

  # GET /parts/new
  def new
    @part = @supplier.parts.new
  end

  # GET /parts/1/edit


  # POST /parts or /parts.json
  def create
    @part = @supplier.parts.new(part_params)

    respond_to do |format|
      if @part.save
        format.html { redirect_to supplier_part_url(@supplier,@part), notice: I18n.t('supplier.part.controller.create') }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  # PATCH/PUT /parts/1 or /parts/1.json
  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to supplier_part_url(@supplier,@part), notice: I18n.t('supplier.part.controller.update') }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1 or /parts/1.json
  def destroy
    @part.destroy

    respond_to do |format|
      format.html { redirect_to supplier_parts_url, notice: I18n.t('supplier.part.controller.destroy') }
      format.json { head :no_content }
    end
  end

  private
  def set_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end
  def set_part
    @part = @supplier.parts.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def part_params
    params.require(:part).permit(:title, :description)
  end
end
