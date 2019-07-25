class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @order = Order.new
  end


end
