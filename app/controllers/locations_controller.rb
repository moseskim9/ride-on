class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find([:location_id])
  end

  def new
    @location = Location.new
  end

  def create
     @bike = Bike.find(params[:bike_id])
      @location = @bike.locations.build(location_params)
        if @location.save
      redirect_to locations_path
        else
      redirect_to
        end
  end

  private

  def location_params
    params.require(:location).permit(:country, :city)
  end

end
