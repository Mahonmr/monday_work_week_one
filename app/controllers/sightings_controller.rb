class SightingsController < ApplicationController
  before_action :set_sighting, only: [:show, :edit, :update, :destroy]
  before_action :set_species, only: [:index, :new, :create, :update, :edit, :destroy]

  def index
    @sightings = @species.sightings.all
  end

  def show
  end

  def new
    @sighting = @species.sightings.new
  end

  def edit
  end

  def create
    @sighting = @species.sightings.new(sighting_params)
    if @sighting.save
      redirect_to species_sightings_path(@species), notice: 'Sighting was successfully created.'
    else
      render :new
    end
  end

  def update
    if @species.sightings.update(@species, sighting_params)
      redirect_to species_sightings_path(@species), notice: 'Sighting was successfully created.'
    else
      render :edit
    end
  end

  def destroy
    @sighting.destroy
    redirect_to species_sightings_path(@species), notice: 'Sighting was successfully destroyed.'
  end

  private
    def set_sighting
      @sighting = Sighting.find(params[:id])
    end

    def set_species
      @species = Species.find(params[:species_id])
    end

    def sighting_params
      params.require(:sighting).permit(:species_id, :latitude, :longitude, :date_sighting)
    end
end
