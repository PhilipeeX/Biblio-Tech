class AssembliesController < ApplicationController
  before_action :set_assembly, only: %i[show edit update destroy]

  def index
    @assemblies = Assembly.all.includes(:parts)
  end

  def show
  end

  def new
    @assembly = Assembly.new
  end

  def edit
  end

  def create
    @assembly = Assembly.new(assembly_params)

    if @assembly.save
      redirect_to assembly_url(@assembly), notice: 'Montagem criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @assembly.update(assembly_params)
      redirect_to assembly_url(@assembly), notice: 'Montagem atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @assembly.destroy
    redirect_to assemblies_url, notice: 'Montagem excluída com sucesso.'
  end

  private
  def set_assembly
    @assembly = Assembly.find(params[:id])
  end

  def assembly_params
    params.require(:assembly).permit(:name, part_ids: [])
  end
end
