class MallsController < ApplicationController
  def index
      # that is actually supposed to be postal code
      # it was done this way because, you know, what if
      # they enter street or something even though it
      # specifically says "Postal Code" in the search field
      location = params[:location]
      SearchedLocation.create(location:location, user: current_user)
      
      @location = GEOCODER.geocode(location)

      @city = @location.city
      @province = @location.province
      @postal = @location.zip

      order = current_user.orders.last
      order.update(city: @city, province: @province, postal: @postal)

      @malls = Mall.find_by_address(params[:location])
      redirect_to root_path if @malls.nil?
  end

  def show
      # On the malls index page, each mall has select button.
      # This button leads here. But. The user doesn't want to 
      # see the mall, right? They care to start ordering. 
      # So, we'll just record the mall in the order here, and 
      # redirect to the new item page right away 
      mall_id = params[:id]
      order = current_user.orders.last
      order.update(mall_id: mall_id)
      redirect_to new_order_item_path(order.id)
  end


end
