require 'spec_helper'

module Salestax
  module TaxRule
    describe TaxRuleEngine do
    
      before :each do
        @engine = TaxRuleEngine.new
      end        
      
      it "#inialize"  do
        @engine.tax_rates.instance_of?(Array).should == true
      end

      it "#rule_for(book)" do
        book_taxs = @engine.rule_for(Goods.new("book")).filter
        book_taxs.map(&:type).include?("basic sales").should == false
        book_taxs.map(&:type).include?("import duty").should == false
      end

      it "#rule_for(music_cd)" do
        music_cd_taxs = @engine.rule_for(Goods.new("music_cd")).filter
        music_cd_taxs.map(&:type).include?("basic sales").should == true
        music_cd_taxs.map(&:type).include?("import duty").should == false
      end
    end
  end
end

