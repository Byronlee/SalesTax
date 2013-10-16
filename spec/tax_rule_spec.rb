require 'spec_helper'

module Salestax
  describe TaxRule do
    
    before :all do
      @exempt = ["books", "book", "chocolates", "chocolate", "pills", "medical"]
    end

    
    context "tax rule" do
      before :all do
        @book_tax_rule = TaxRule.new("book")
        @music_cd_tax_rule = TaxRule.new("music CD")
      end

      it "book has no tax " do
        @book_tax_rule.is_exempt?.should ==  true
        @book_tax_rule.is_imported?.should == false
      end

      it "music has basic tax" do
        @music_cd_tax_rule.is_exempt?.should ==false
        @music_cd_tax_rule.is_imported?.should == false
      end
    end

  end
end
