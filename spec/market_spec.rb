require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do 
  before (:each) do 
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)

    @vendor2 = Vendor.new("Ba-Nom-a-Nom")    
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)

    @vendor3 = Vendor.new("Palisade Peach Shack")    
    @vendor3.stock(@item1, 65)
  end

  it "exists and has readable attributes" do 
    expect(@market).to be_a Market
    expect(@market.name).to eq "South Pearl Street Farmers Market"
    expect(@market.vendors).to eq([])
  end

  describe "#add_vendor" do 
    it "can add vendor objects to the @vendors array" do 
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)      
      @market.add_vendor(@vendor3)

      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end
  end

  describe "#vendor_names" do 
    it "can return an array of all vendor names" do 
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)      
      @market.add_vendor(@vendor3)

      expect(@market.vendor_names).to  eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe "#vendors_that_sell" do 
    it "can return an array of vendors who sell the given item" do 
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)      
      @market.add_vendor(@vendor3)

      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
    end
  end

  describe "#potential_revenue" do 
    it "can show a vendor's potential revenue by multiplying the sum of all their item's prices by quantity" do
      expect(@vendor1.potential_revenue).to eq 29.75
      expect(@vendor2.potential_revenue).to eq 345.00
      expect(@vendor3.potential_revenue).to eq 48.75
    end
  end

  describe "#sorted_item_list" do 
    it "can return an array of all items that all vendors have in stock, sorted alphabetically, with NO DUPLICATES" do 
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)      
      @market.add_vendor(@vendor3)

      expect(@market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
    end
  end

  describe "#total_inventory" do 
    it "can return the quantity of all items sold at the market" do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)      
      @market.add_vendor(@vendor3)

        expected = {
          @item1 => {
            quantity: 100, 
            vendors_that_sell: [@vendor1, @vendor3]
          },
          @item2 => {
            quantity: 7,
            vendors_that_sell: [@vendor1]
          },
          @item3 => {
            quantity: 25,
            vendors_that_sell: [@vendor2]
          },
          @item4 => {
            quantity: 50,
            vendors_that_sell: [@vendor2]
          }
        }

      expect(@market.total_inventory).to eq(expected)
    end
  end
end