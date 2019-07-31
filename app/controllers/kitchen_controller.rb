class KitchenController < ApplicationController

  def orders
  end

  def manager
    @tables = Table.all
    # Update application.html.erb <%= javascript_include_tag 'application' %>


  end

end
