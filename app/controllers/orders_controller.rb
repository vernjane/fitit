class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    # May 9, 2018: 
    # Well, at this point this should never happen, b/c
    # when a guest user is created, a new order is created right away,
    # and returning users are not really expected. If they do happen,
    # we'll need to add something like "status", and mark orders as 
    # "completed", so that it doesn't look for the completed orders
    # when a user comes back. But that... You know, later 
    @order = current_user.orders.new()
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.save
    redirect_to @order
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def edit
    @order = current_user.orders.find(params[:id])
  end

  def update
    order_id = params[:id]
    @order = current_user.orders.find(order_id)
    @order.update(order_params)
    redirect_to order_path(@order)
end

  
  private
  def order_params
    params.require(:order).permit(:fname,:lname,:email,:phone,:street_address,:unit_number,:city,:province,:postal)
  end
end



      

