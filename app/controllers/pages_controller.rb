class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:home]
  class << self
    attr_accessor :dummy_items, :cart_props
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

  def self.construct_cart_props(items)
    total = (items.map { |i| i.price * i.quantity }.reduce(:+).to_f / 100.to_f).round(2) 
    gratuity = (total * 0.1).round(2)
    
    return { items: items, total: total, gratuity: gratuity }  
  end

  @dummy_items = PagesController.seed_items(3 + Random.rand(7))

  @cart_props = PagesController.construct_cart_props(@dummy_items)

  

  def home
  end

  def cart
    #@items = self.class.seed_items(3 + Random.rand(7))
    #@items = PagesController.seed_items(3 + Random.rand(7))
    if params[:num].nil? 
      @cart_props = self.class.cart_props
    else
      self.class.dummy_items = PagesController.seed_items(params[:num].to_i)
      @cart_props = PagesController.construct_cart_props(self.class.dummy_items)
    end
  end

  def pay
    @cart_props = self.class.cart_props
  end

  def feedback
    @cart_props = self.class.cart_props
  end
   
end
