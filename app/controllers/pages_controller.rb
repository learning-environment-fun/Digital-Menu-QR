class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:pay]
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
     @cart = OrderItem.find(params[:id])
  end

  def pay
    @order = Order.find(params[:order_id])
  end

  def feedback
    @order = Order.find(params[:id])
  end

end
