# -*- coding: utf-8 -*-

module Salestax
  class TaxRule 

    BASIC_TAX_RATE = 0.10 
    EXEMPT_TAX_RATE = 0.00
    IMPORT_TAX_RATE = 0.05 

    # name or type ? 
    def initialize goods_name
      @goods_name = goods_name
      @exempts = ["book", "chocolate", "pills", "medical"]
      @imports = ["import","imported"]
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
        return true if @goods_name.include? item
      end
      false
    end
    
    def is_imported?
      @imports.each do | item | 
        return true if @goods_name.include? item
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
