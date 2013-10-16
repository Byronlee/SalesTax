module Salestax
  class Goods
    attr_accessor :type
    attr_reader :tax_rates
    

    def initialize(type, one_or_some_tax_rates=[])
      @type = type
      @tax_rates = one_or_some_tax_rates.instance_of?(Array) ? 
                   one_or_some_tax_rates : [one_or_some_tax_rates]
    end


    def add_tax_rate tax_rate
      @tax_rates << tax_rate
    end
    
    def remove_tax tax_rate
      @tax_rates.delete tax_rate
    end

    
  end
end
