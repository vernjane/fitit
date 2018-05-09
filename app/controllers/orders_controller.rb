class OrdersController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.save
    redirect_to @order
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  
  private
  def order_params
    params.permit(:fname,:lname,:email,:phone,:street_address,:unit_number,:city,:province,:postal)
  end
end



      

