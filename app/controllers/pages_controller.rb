class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:home]

  def home

  end

  def cart

    #@cart = Order.find(params[:id])

    @cart = OrderItem.find(params[:id])
  end

  # def feedback
  #   @cart_props = self.class.cart_props
  # end

end
