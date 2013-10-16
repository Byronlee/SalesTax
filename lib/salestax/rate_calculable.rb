module Salestax
  module RateCalculable
    
    class << self
      def calculator
        Calculator.new
      end
    end
    
    def total_taxes 

      total = self.goods.tax_rates.inject(0) do |total, tax_rate|
        total += (self.price*tax_rate.rate*20.0).ceil / 20.0
      end
      RateCalculable.calculator.format total
    end
    
    def price_after_tax
      RateCalculable.calculator.format self.price+total_taxes
    end
  end
end
