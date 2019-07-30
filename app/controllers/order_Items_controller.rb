class OrderItemsController < ApplicationController



  def create

  @order_item = OrderItem.new(order_items_params)
  @order = Order.find(params[:order_id])
  if @order_item.save
    if params[:add_to_cart]
      redirect_to cart_order_path(@order.id, @orderItem)

    else params[:order_now]
      redirect_to pay_path(@order.id, @orderItem)

    end
  else
    render "items/show"
  end
  end

def destroy
 @order_item = OrderItem.find(params[:id])
 @order_item.destroy
 redirect_to cart_order_path(@order_item.order, @order_item)
end

  private

def order_items_params
    permitted_params = params.require(:order_item).permit(:quantity, :order_id, :item_id, :item_price)
  end



end
