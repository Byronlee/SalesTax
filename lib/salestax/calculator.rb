module Salestax
  class Calculator
    
    CONST_UNIT = 2

    def format number
      number.round CONST_UNIT
    end

  end
end
