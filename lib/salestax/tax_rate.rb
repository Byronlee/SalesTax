module Salestax
  class TaxRate
    attr_accessor :type, :rate

    def initialize type="basic sales", rate=0.10
      @type, @rate = type, rate
    end
    
  end
end
