class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def cart

  end

  def pay

  end

  def feedback

  end

  private 

  class DummyItem
    def dollars 
      @price.to_f / 100
    end
    
    def initialize(title = "title", price = 230)
      @title = title
      @price = price
    end
  end
end
