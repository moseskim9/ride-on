class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
    # @bike = Bike.find(params[:id])
  end

  # def new
  #   @bike = Bike.find(params[:bike_id])
  #   @location = @bike.locations.new
  # end

  # def create
  #   @bike = Bike.find(params[:bike_id])
  #   @location = @bike.locations.build(location_params)
  #   if @location.save!
  #     redirect_to locations_path
  #   else
  #     redirect_to root_path
  #   end
  # end

  # private

  # def location_params
  #   params.require(:location).permit(:country, :city)
  # end

end
