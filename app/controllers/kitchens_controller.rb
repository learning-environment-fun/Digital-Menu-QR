class KitchensController < ApplicationController
def kitchen_orders
  @tables = Table.all
  @orders = @tables.orders
end
end
