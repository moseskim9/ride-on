class PagesController < ApplicationController
  def welcome
    @bikes = Bike.all
  end
end
