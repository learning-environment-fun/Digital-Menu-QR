class KitchensController < ApplicationController
  
  def orders
    @tables = Table.all
    @orders = @tables.orders
  end

  def orders_list
    @orders = Order.all.sort_by { |order| order.id }
    render partial: 'orders_list'
  end

  def manager
    @tables = Table.all
    # Update application.html.erb <%= javascript_include_tag 'application' %>


  end

end
