class ItemsController < ApplicationController
    def new
        ## view calls 'items_list' partial 
        order_id = params[:order_id]
        @order=current_user.orders.find(order_id)
        if @order.nil?
            @order = current_user.orders.create
        end

        @item = @order.items.new

        # this is needed b/c the view calls "items_list" partial
        @items = @order.items
        
        # Side note:
        # In the items_list partial you'll see a check for
        # item.id.nil? This is needed b/c aparently that 
        # @order.items.new is being included in the order.items list.
        # Fuck knows why, and, tbh, who cares.

        # this is needed b/c the view calls "items_list" partial
        @place_order_button = is_place_order_button_needed(@items)
    end

    def is_place_order_button_needed(items)
        # no items at all? 
        # the button is not needed
        if items.length < 1
            return false
        end
        
        # only one item in the order? 
        # check if it is this item.new unreal-real item (it's id will be nil)
        if items.length == 1
            return !items.last.id.nil?
        end

        # more than 1 item? 
        # obviously we need the "place order" button!
        return true
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
        ## view calls 'items_list' partial 
        order_id = params[:order_id]
        @order = current_user.orders.find(order_id)
        @items = @order.items

        # this is needed b/c the view calls "items_list" partial
        @place_order_button = is_place_order_button_needed(@items)
    end

    def update
        order_id = params[:order_id]
        @order = current_user.orders.find(order_id)
        @item = @order.items.find(params[:id])
        @item.update(item_params)
        # items list is now in the new form 
        # (so that the user can see what's already in the order)
        # so instead of items index path (order_items_path(@order)),
        # redirect to new item path
        redirect_to new_order_item_path(@order)
    end

    def destroy
        order_id = params[:order_id]
        @order = current_user.orders.find(order_id)
        @item = @order.items.find(params[:id])
        @item.destroy
        # items list is now in the new form 
        # (so that the user can see what's already in the order)
        # so instead of items index path (order_items_path(@order)),
        # redirect to new item path
        redirect_to new_order_item_path(@order)

    end
    
    private
    def item_params
        params.require(:item).permit(:description, :color, :size)
    end
end

# NOTES:

=begin
    items_list partial is called from index and new
    items_list needs '@items' and '@place_order_button'
    @place_order_button: run is_place_order_button_needed(items)
=end