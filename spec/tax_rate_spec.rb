require 'spec_helper'

module Salestax
  describe TaxRate  do
    
    before :each do
      @tax_rate = TaxRate.new
    end

    context "all kinds of tax rates" do
      it "basic sales is default basic" do
        @tax_rate.type.should == "basic sales"
      end

      it "basic sales'rate is 10%" do
        @tax_rate.rate.should == 0.1
      end

      it "may be import duty" do
        tax_rate = TaxRate.new("import duty", 0.05)
        tax_rate.rate.should == 0.05
        tax_rate.type.should == "import duty"
      end
      
    end

  end
end
