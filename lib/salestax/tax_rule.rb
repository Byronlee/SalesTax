# -*- coding: utf-8 -*-

module Salestax
  class TaxRule 

    BASIC_TAX_RATE = 0.10 
    EXEMPT_TAX_RATE = 0.00
    IMPORT_TAX_RATE = 0.05 

    # name or type ? 
    def initialize
      @exempts = ["book", "chocolate", "pills", "medical"]
      @imports = ["import","imported"]
    end

    def rule_for object
      (@object = object) && self
    end


    def basic_tax_rate
      TaxRate.new("basic tax",BASIC_TAX_RATE)
    end

    def import_duty
      TaxRate.new("import duty",IMPORT_TAX_RATE)
    end

    def exempt_tax_rate
      TaxRate.new("exempt", EXEMPT_TAX_RATE)
    end

    def is_exempt?
      @exempts.each do | item | 
        return true if @object.name.include? item
      end
      false
    end
    
    def 


    def is_imported?
      @imports.each do | item | 
        return true if @object.name.include? item
      end
      false
    end
    
    def total_rates
      tax_rate_array = [exempt_tax_rate]
      tax_rate_array << basic_tax_rate  unless is_exempt? 
      tax_rate_array << import_duty  if is_imported? 
      tax_rate_array
    end
  end
end




a_rule = TaxRule new "a rule" do 
   product_names: ["book", "cholate"] 
   tax: {"base_tax": 0.01, "individual income tax": 0.02}
   enda_
rule.assert "book.."
engine = TaxEngine.newengine.add a_rule
