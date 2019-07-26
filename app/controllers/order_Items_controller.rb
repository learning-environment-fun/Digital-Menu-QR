class OrderItemsController < ApplicationController



  def create

  @order_item = OrderItem.new(order_items_params)
  @order = Order.find(params[:order_id])
  if @order.save
    if params[:add_to_cart]
      redirect_to order_path(@order)

    else params[:order_now]
      redirect_to cart_path(@order, @orderItem)

    end
  else
    render "items/show"
  end
  end

  private

def order_items_params
    permitted_params = params.require(:order_item).permit(:quantity, :order_id, :item_id, :item_price)
  end


end
