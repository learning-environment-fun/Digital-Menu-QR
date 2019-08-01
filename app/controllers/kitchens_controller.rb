class KitchensController < ApplicationController

  def orders
    @tables = Table.last(8)
    #@orders = @tables.orders
  end

  def manager
    @tables = Table.all
    # Update application.html.erb <%= javascript_include_tag 'application' %>


  end

end
