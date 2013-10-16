require 'spec_helper'

module Salestax
  describe Receipt do
    
    before :each do

      @basket = Basket.new
      @book = Goods.new("book")
      @book_basket_item = BasketItem.new(@book, 1, 12.49)

      @music_cd = Goods.new("music CD")
      @music_cd_basket_item = BasketItem.new(@music_cd, 1, 14.99)

      @chocolate = Goods.new("chocolate bar")
      @chocolate_basket_item = BasketItem.new(@chocolate, 1, 0.85
)
      @basket.add_item @book_basket_item
      @basket.add_item @music_cd_basket_item
      @basket.add_item @chocolate_basket_item 
      @receipt = Receipt.new @basket
      

    end

    it "should be a item of receipt" do
      @receipt.items.should == [ { amount: 1,
                                   goods_name: "book",
                                   price_after_tax: "12.49" },
                                 { amount: 1,
                                   goods_name: "music CD",
                                   price_after_tax: "16.49" },
                                 { amount: 1,
                                   goods_name: "chocolate bar",
                                   price_after_tax: "0.85" }
                               ]
    end

    it "should return sales_taxes of the recepit" do
      @receipt.sales_taxes.should == "1.50"
      @receipt.total.should == "29.83"
    end
  end

end
