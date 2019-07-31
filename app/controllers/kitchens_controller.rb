class KitchensController < ApplicationController
def kitchen_orders
  render 'kitchen/kitchen_orders'
  @tables = Tables.all
end
end
