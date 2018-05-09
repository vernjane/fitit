class ItemsController < ApplicationController
    def new
        order_id = params[:order_id]
        @order=current_user.orders.find(order_id)
        if @order.nil?
            @order = current_user.orders.create
        end
        @item = @order.items.new
    end

    def edit
        @order = current_user.orders.find(params[:order_id])
        @item = @order.items.find(params[:id])
    end

    def create
        order_id = params[:order_id]
        @order = current_user.orders.find(order_id)
        @order.items.create(item_params)
        redirect_to order_items_path(@order)
    end

    def index
        order_id = params[:order_id]
        @order = current_user.orders.find(order_id)
        @items = @order.items
    end

    def update
        byebug
        order_id = params[:order_id]
        @order = current_user.orders.find(order_id)
        @item = @order.items.find(params[:id])
        @item.update(item_params)
        redirect_to order_items_path(@order)
       
        
      end
    
    private
    def item_params
        params.permit(:description, :color, :size)
    end
end
