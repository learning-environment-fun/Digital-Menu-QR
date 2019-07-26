class PagesController < ApplicationController
  
  def home
  end

  def cart
  end

  def pay
  end

  def feedback
    @order = Order.find(params[:id])
  end
   
end
