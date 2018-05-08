class MallsController < ApplicationController
  def index
      location = params[:location]
      SearchedLocation.create(location:location, user: current_user)
      
      @location = GEOCODER.geocode(location)
      @malls = Mall.find_by_address(params[:location])
      redirect_to root_path if @malls.nil?
  end

  def show

  end


end
