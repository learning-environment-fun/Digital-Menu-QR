class OrderItemsController < ApplicationController



  def create

  @orderItem = OrderItem.new(quantity: params[:quantity], order_id: params[:order], item_id: params[:item])
  @orderItem.save

  @order = Order.find(params[:order_id])

    if params[:add_to_cart]
      redirect_to root_path(@order)

    elsif params[:order_now]
      redirect_to cart_path(@order)

    end

  end


end
