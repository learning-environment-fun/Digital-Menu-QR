class OrderItemsController < ApplicationController



  def create
  @order_item = OrderItem.new(order_items_params)
  @order = Order.find(params[:order_id])
  if @order_item.save
      redirect_to cart_order_path(@order, @orderItem)

  else
    render "items/show"
  end
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order = Order.find(params[:order_id])

    order_item.destroy

    redirect_to cart_order_path(order)
  end

  private

def order_items_params
    params.require(:order_item).permit(:quantity, :order_id, :item_id, :item_price)
  end


end