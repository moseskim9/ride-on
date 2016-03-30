class PagesController < ApplicationController
  def welcome
    @locations = Location.all
  end
end
