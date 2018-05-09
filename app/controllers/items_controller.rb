class ItemsController < ApplicationController
    def new
        order_id = params[:order_id]
        @order=current_user.orders.find(order_id)
        if @order.nil?
            @order = current_user.orders.create
        end

        @item = @order.items.new

        # this is needed to show all items already added to the order
        @items = @order.items
        
        
    end

    def edit
        @order = current_user.orders.find(params[:order_id])
        @item = @order.items.find(params[:id])
    end

    def create
        order_id = params[:order_id]
        @order = current_user.orders.find(order_id)
        @order.items.create(item_params)
        # items list is now in the new form 
        # (so that the user can see what's already in the order)
        # so instead of items index path (order_items_path(@order)),
        # redirect to new item path
        redirect_to new_order_item_path(@order)
    end

    def index
        order_id = params[:order_id]
        @order = current_user.orders.find(order_id)
        @items = @order.items
    end

    def update
        order_id = params[:order_id]
        @order = current_user.orders.find(order_id)
        @item = @order.items.find(params[:id])
        @item.update(item_params)
        redirect_to order_items_path(@order)
    end
    
    private
    def item_params
        params.require(:item).permit(:description, :color, :size)
    end
end
