class MallsController < ApplicationController
  def index
      @location = GEOCODER.geocode(params[:location])
      @malls = Mall.find_by_address(params[:location])
      redirect_to root_path if @malls.nil?
  end

  def show

  end


end
