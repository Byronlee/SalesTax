require 'spec_helper'

module Salestax
  describe TaxRule do
    
    context "tax rule" do
      before :all do
        @tax_rule = TaxRule.new
        @book = Goods.new("books")
        @music_cd = Goods.new("music CD")
      end

      it "#basic_tax_rate" do
   #     @tax_rule.
      end



      it "book has no tax " do
        @book.own_tax_rates.map(&:type).include?("import duty").should == false
        @book.own_tax_rates.map(&:type).include?("basic tax").should == false
      end

      it "music has basic tax" do
        @music_cd.own_tax_rates.map(&:type).include?("import duty").should == false
        @music_cd.own_tax_rates.map(&:type).include?("basic tax").should == true
      end
    end

  end
end
