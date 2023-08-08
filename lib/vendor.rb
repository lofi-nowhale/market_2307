class Vendor 
  attr_reader :name, :inventory
  def initialize(name)
    @name = name 
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    revenue = 0 
   @inventory.sum do |item, quantity|
     item_rev = item.price * quantity
     revenue += item_rev
    end
    revenue
  end
end