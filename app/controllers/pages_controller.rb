class PagesController < ApplicationController
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
   
end
