class Api::AssembliesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_assembly, only: %i[show edit update destroy]

  def index
    if params[:part_name].present?
      @assemblies = Assembly.joins(:parts).where('parts.title ILIKE ?', "%#{params[:part_name]}%").distinct
    else
      @assemblies = Assembly.all.includes(:parts)
    end

    respond_to do |format|
      format.json { render json: @assemblies, include: { book: { except: %i[created_at updated_at] }, parts: { except: %i[created_at updated_at] } }, except: %i[created_at updated_at]}
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @assembly }
    end
  end

  def create
    @assembly = Assembly.new(assembly_params)

    if @assembly.save
      respond_to do |format|
        format.json { render json: @assembly, status: :created, except: %i[created_at updated_at] }
      end
    else
      respond_to do |format|
        format.json { render json: @assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @assembly.update(assembly_params)
      respond_to do |format|
        format.json { render json: @assembly, except: %i[created_at updated_at] }
      end
    else
      respond_to do |format|
        format.json { render json: @assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assembly.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
  def set_assembly
    @assembly = Assembly.find(params[:id])
  end

  def assembly_params
    params.require(:assembly).permit(:name, part_ids: [])
  end
end
