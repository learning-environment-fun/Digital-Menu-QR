class OrdersController < ApplicationController
  respond_to :json

  def show
    @order = Order.find(params[:id])
    @restaurant = @order.table.restaurant
    @items = @restaurant.items
    @table = @order.table


    @menu = @items.where(restaurant_id: @restaurant.id)
    @appetizer = @menu.where(food_type: "food_app")
    @food = @menu.where(food_type: "food_main")
    @drink = @menu.where(food_type: "drink")
    @dessert = @menu.where(food_type: "food_dessert")
  end

  def create
    @table = Table.find(params[:table_id])
    @order = Order.create(table: @table)
    redirect_to order_path(@order)
  end

  def update
    @order = Order.find(params[:id])
  end

  def handle_order_json
    render :json => params
  end
end
