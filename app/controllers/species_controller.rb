class SpeciesController < ApplicationController
  before_action :set_species, only: [:show, :edit, :update, :destroy]

  def index
    @species = Species.all
  end

  def new
    @species = Species.new
  end

  def edit
  end

  def create
    @species = Species.new(species_params)
    if @species.save
      redirect_to species_index_path, notice: 'Species was successfully saved.'
    else
      render :new
    end
  end

  def update
    if @species.update(species_params)
      redirect_to species_index_path, notice: 'Species was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @species.destroy
    redirect_to species_index_path, notice: 'Species was successfully destroyed.'
  end

  private
    def set_species
      @species = Species.find(params[:id])
    end

    def species_params
      params.require(:species).permit(:name, :endangered_species)
    end
end
