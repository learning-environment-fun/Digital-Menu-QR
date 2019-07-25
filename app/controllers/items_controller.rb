class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @order = Order.find(params[:order_id])
    @order_item = OrderItem.new
  end


end
