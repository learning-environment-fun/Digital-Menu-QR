class OrderItemsController < ApplicationController



  def create
  @orderItem = OrderItem.new(quantity: params[:quantity], item: params[:id])
  @orderItem.save

    if params[:add_to_cart]
      redirect_to root_path

    elsif params[:order_now]
      redirect_to root_path

    end

  end


end
