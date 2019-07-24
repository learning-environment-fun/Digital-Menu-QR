class OrdersController < ApplicationController

  def create
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
  end
end
