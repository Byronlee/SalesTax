
require 'spec_helper'

module Salestax
  describe Basket do

    before :each do
      @basket = Basket.new
      @tax_rate = TaxRate.new("no tax", 0)
      @book = Goods.new("book")
      @book_basket_item = BasketItem.new(@book, 1, 12.49)
      @tax_rate = TaxRate.new("basic tax", 0.1)
      @music_cd = Goods.new("music CD")
      @music_cd_basket_item = BasketItem.new(@music_cd, 1, 14.99)
    end
    
    it "maybe has a book basket item" do
      @basket.add_item @book_basket_item
      @basket.items.should include @book_basket_item
    end

    it "put a music CD into basket " do
      @basket.add_item @music_cd_basket_item
      @basket.items.should include @music_cd_basket_item
    end

    context "basket receipt details " do

      it "#sales_taxes" do
        # @basket.sales_taxes.should == 1.29
      end

      it "#total"  do
        # @basket.total.should == 27.17
      end
    end
  end
end
