require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do 
  before (:each) do 
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it "exists and has readable attributes" do 
    expect(@vendor).to be_a Vendor
    expect(@vendor.name).to eq "Rocky Mountain Fresh"
    
    expect(@vendor.inventory).to eq({})
    expect(@item1.name).to eq("Peach")
  end

  describe "#check_stock" do 
    it "can read the inventory hash and return the stock of the item as an integer" do
      expect(@vendor.check_stock(@item1)).to eq(0)
    end
  end

  describe "#stock" do 
    it "can add stock as a key/value pair to the inventory hash" do 
      @vendor.stock(@item1, 30)

      expect(@vendor.inventory).to eq({@item1 => 30})
      
      expect(@vendor.check_stock(@item1)).to eq(30)
      
      @vendor.stock(@item1, 25)
      
      expect(@vendor.check_stock(@item1)).to eq(55)
      
      @vendor.stock(@item2, 12)

      expected = {
        @item1 => 55, 
        @item2 => 12
      }
      
      expect(@vendor.inventory).to eq(expected)
    end
  end
end