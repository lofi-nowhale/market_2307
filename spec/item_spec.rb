require './lib/item'
require './lib/vendor'

RSpec.describe Item do 
  before (:each) do 
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  it "exists and has readable attributes" do 
    expect(@item1.name).to eq("Peach")
    expect(@item2.price).to eq(.75)
    expect(@item2.name).to eq("Tomato")
    expect(@item2.price).to eq(0.5)
  end
end