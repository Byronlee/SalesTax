module Salestax
  class BasketItem 

    include RateCalculable

    attr_accessor :goods, :amount, :price
    
    def initialize(goods, amount=1, price)
      @goods, @amount, @price = goods, amount, price
    end

  end
end
