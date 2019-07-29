class OrdersController < ApplicationController
  respond_to :json

  def show
    @order = Order.last
    @restaurant = @order.table.restaurant
    @items = @restaurant.items
    @table = @order.table

    @menu = @items.where(restaurant_id: @restaurant.id)
    @appetizer = @menu.where(food_type: "food_app")
    @food = @menu.where(food_type: "food_main")
    @drink = @menu.where(food_type: "drink")
    @dessert = @menu.where(food_type: "food_dessert")
  end

def menu
@order = Order.last
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

  def cart
    @order = Order.find(params[:id])
    render "pages/cart"
    #@order_items = @order.order_item(items)
  end


#   def handle_order_json
#     items = params[:items].map do |item|
#       {
#         item_id: item["id"],
#         quantity: item["quantity"],
#         unit_price: item["unitPrice"]
#       }
#     end

#     costWithoutTip = items.map { |i| i[:quantity] * i[:unit_price] }.reduce(:+)
#     costOfTip = costWithoutTip.to_f * params[:gratuityPercentage].to_f / 100.to_f
#     totalCost = (costWithoutTip + costOfTip).to_i

#     kitchen_status = "pending"
#     transaction_status = "paid"
#     transaction_type = "food order"

#     # hack, broken seed fml
#     table = Table.create(restaurant_id: Restaurant.first.id, table_number: "4")

#     order_hash = { table_id: table.id, user_id: User.first.id, :kitchen_status => kitchen_status, :transaction_status => transaction_status,
#     :transaction_price => totalCost, :transaction_type => transaction_type }

#     puts order_hash



#     #order = Order.create!(order_hash)

#     items.each do |i|
#       OrderItem.create!(item_id: i[:item_id], order_id: order.id, quantity: i[:quantity], item_price: i[:unit_price])
#     end
#     puts "order id " + order.id.to_s
#     render :json => { id: order.id }
#     # redirect_to "/feedback/#{order.id}"
#   end

end
