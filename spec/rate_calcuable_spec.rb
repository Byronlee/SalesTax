require 'spec_helper'

module Salestax
  describe RateCalculable do
    
    context ".calculator" do 
      it "should be a calculator" do
        RateCalculable.calculator.should be_instance_of Calculator
      end
      
    end

    context "#total_taxes" do
      it "should get total taxes of the book" do
        book = Goods.new("book")
        book_basket_item = BasketItem.new(book, 1, 12.95)
        book_basket_item.total_taxes.should == 0
      end
    end
    
    context "#price_after_tax" do
      it "should get the book price after tax" do
        book = Goods.new("book")
        book_basket_item = BasketItem.new(book, 1, 12.95)

        book_basket_item.price_after_tax.should == 12.95
      end
      

      it "should get the music CD price after tax rate" do
        basic_tax_rate = TaxRate.new("basic tax rate", 0.1)
        music_cd = Goods.new("music CD")
        music_cd_basket_item = BasketItem.new(music_cd, 1, 14.49)
        music_cd_basket_item.price_after_tax.should == 15.94
      end
    end
  end
end
