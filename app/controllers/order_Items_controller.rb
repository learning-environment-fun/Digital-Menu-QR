class OrderItemsController < ApplicationController



  def create
  @order_item = OrderItem.new(order_items_params)
  @order = Order.find(params[:order_id])
  if @order.save
    if params[:add_to_cart]
      redirect_to order_path(@order)

    else params[:order_now]
      redirect_to pay_path(@order.id, @orderItem)

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
