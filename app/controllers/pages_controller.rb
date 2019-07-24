class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:home]
  class << self
    attr_reader :dummy_items, :cart_props
  end

  class DummyItem
    
    attr_reader :title, :price, :quantity
    
    def dollars 
      (@price.to_f / 100.to_f * @quantity.to_f).round(2)
    end

    def initialize(title = "title", price = 230, quantity = 1)
      @title = title
      @price = price
      @quantity = quantity
    end
  end

  def self.seed_items(n)
    items = []
    
    n.times do 
      items << DummyItem.new(Faker::Games::Pokemon.name, 100 + Random.rand(2000), 1 + rand(10))
    end
    return items
  end

  @dummy_items = PagesController.seed_items(3 + Random.rand(7))

  @cart_props = { items: @dummy_items, total: @dummy_items.map { |i| i.price * i.quantity }.reduce(:+).to_f / 100.to_f }

  def home
  end

  def cart
    #@items = self.class.seed_items(3 + Random.rand(7))
    #@items = PagesController.seed_items(3 + Random.rand(7))
    if params[:num].nil? 
      @cart_props = self.class.cart_props
    else
      new_items = PagesController.seed_items(params[:num].to_i)
      @cart_props = { items: new_items, total: new_items.map { |i| i.price * i.quantity }.reduce(:+).to_f / 100.to_f }
    end
  end

  def pay
    @items = PagesController.seed_items(3 + Random.rand(7))
  end

  def feedback
    @items = PagesController.seed_items(3 + Random.rand(7))
  end
   
end
