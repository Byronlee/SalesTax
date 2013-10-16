require 'spec_helper'

module Salestax
  describe Goods do

    before :each do
      @tax_rates = [double("some taxs")]
      @tax_rate = double "some tax"
      @goods = Goods.new("book", @tax_rates)
    end


    context "#initiliaze" do

      it "has many tax rates"  do
        @goods.tax_rates.should == @tax_rates
        @goods.tax_rates.instance_of?(Array).should be_true
      end

      it "have one tax rate" do
        goods = Goods.new("book", @tax_rate)
        goods.tax_rates.should == [@tax_rate]
      end
    end

  end
end
