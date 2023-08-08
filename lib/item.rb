class Item
  attr_reader :name, :item_price
  def initialize(item_details)
    @name = item_details[:name]
    @item_price = item_details[:price]
  end

  def price
    @item_price.delete('$').to_f
  end
end