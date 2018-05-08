class OrdersController < ApplicationController
  def new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to @order
  end

  private
  def order_params
    params.permit(:fname,:lname,:email,:phone,:street_address,:unit_number,:city,:province,:postal)
  end
end



      

