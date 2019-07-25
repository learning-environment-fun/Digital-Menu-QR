class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:home]

  def home

  end

  def pay
    @cart_order = Order.find
  end

  # def feedback
  #   @cart_props = self.class.cart_props
  # end

end
