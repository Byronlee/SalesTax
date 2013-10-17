module Salestax
  class Goods
    # attr_accessor :type
    attr_accessor :name
    attr_reader :tax_rates
    

    def initialize(name)
      @name = name
   #  @type = type
    end


    def add_tax_rate tax_rate
      @tax_rates << tax_rate
    end
    
    def remove_tax tax_rate
      @tax_rates.delete tax_rate
    end

    def own_tax_rates 
      TaxRule.new.rule_for(self).total_rates
      # engine = Rule.engine.new
      # engine.replace "",TaxRate.new
      # engine.rule_for(self).total_rates
      # engine.send(:basictax).change_rate 1.35
      # engine.rule_for(self).total_rates



    end    
  end
end
