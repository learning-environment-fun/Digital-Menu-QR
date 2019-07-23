class RestaurantsController < ApplicationController

  def show
    @menu = Item.where(id_restaurant: params[:id])
  end

end
