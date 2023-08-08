require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do 
  before (:each) do 
    # @item1 = Item.new({name: 'Peach', price: "$0.75"})
    # @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it "exists and has readable attributes" do 
    expect(@vendor).to be_a Vendor
    expect(vendor.name).to eq "Rocky Mountain Fresh"
    
    expect(vendor.inventory).to eq {}
    
  end
end