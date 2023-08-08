class Market 
  attr_reader :name, :vendors
  def initialize(name)
    @name = name 
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    names = []
    @vendors.find_all do |vendor|
      names << vendor.name
    end
    names
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def sorted_item_list
    items = []
    @vendors.find_all do |vendor|
      vendor.inventory.map do |item|
        items << item[0].name
      end 
    end
    items.uniq.sort
  end

  def total_inventory
    market_inventory = Hash.new { |hash, key| hash[key] = {quantity: 0, vendors_that_sell: []}}

    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        market_inventory[item][:quantity] += quantity
        market_inventory[item][:vendors_that_sell] << vendor
      end
    end
    market_inventory
  end
end