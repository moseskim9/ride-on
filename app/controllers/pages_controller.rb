class PagesController < ApplicationController
  def welcome
    @locations = Location.all
    @latest_bikes = Bike.latest
  end
end
