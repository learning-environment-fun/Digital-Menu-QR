class PagesController < ApplicationController
<<<<<<< HEAD
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

=======
  respond_to :json
  protect_from_forgery unless: -> { json_request? }
  skip_before_action :verify_authenticity_token, if: :json_request?

  def json_request?
    request.format.json?
  end

  def home
    @restaurants = Restaurant.all
  end

  def cart
  end

  def pay
  end

  def feedback
    @order = Order.find(params[:id])
  end
   
>>>>>>> c4309b6080d79d63d7c27e4b056e905949dc39f3
end
