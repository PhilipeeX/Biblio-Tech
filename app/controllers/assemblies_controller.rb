class AssembliesController < ApplicationController
  before_action :set_assembly, only: %i[show edit update destroy]

  def index
    if params[:part_name].present?
      @assemblies = Assembly.joins(:parts).where('parts.title ILIKE ?', "%#{params[:part_name]}%").distinct
    else
      @assemblies = Assembly.all.includes(:parts)
    end
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
      redirect_to assembly_url(@assembly), notice: I18n.t('assembly.controller.action_create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @assembly.update(assembly_params)
      redirect_to assembly_url(@assembly), notice: I18n.t('assembly.controller.action_update.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @assembly.destroy
    redirect_to assemblies_url, notice: I18n.t('assembly.controller.action_destroy.success')
  end

  private
  def set_assembly
    @assembly = Assembly.find(params[:id])
  end

  def assembly_params
    params.require(:assembly).permit(:name, part_ids: [])
  end
end
