module Salestax
  class TaxRate
    attr_accessor :type, :rate, :scope

    def initialize type="no basic sales", rate=0.00, scope=[]
      @type, @rate, @scope = type, rate, scope
    end
    
  end
end
