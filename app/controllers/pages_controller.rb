class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:home]
  class << self
    attr_reader :dummy_items, :cart_props
  end

  class DummyItem
    
    attr_reader :title, :price
    
    def dollars 
      (@price.to_f / 100.to_f).round(2)
    end

    def initialize(title = "title", price = 230)
      @title = title
      @price = price
    end
  end

  def self.seed_items(n)
    items = []
    
    n.times do 
      items << DummyItem.new(Faker::Games::Pokemon.name, 100 + Random.rand(2000))
    end
    return items
  end

  @dummy_items = PagesController.seed_items(3 + Random.rand(7))

  @cart_props = { items: @dummy_items, total: @dummy_items.map { |i| i.price }.reduce(:+).to_f / 100.to_f }

  def home
  end

  def cart
    #@items = self.class.seed_items(3 + Random.rand(7))
    #@items = PagesController.seed_items(3 + Random.rand(7))
    @cart_props = self.class.cart_props
  end

  def pay
    @items = PagesController.seed_items(3 + Random.rand(7))
  end

  def feedback
    @items = PagesController.seed_items(3 + Random.rand(7))
  end
   
end
