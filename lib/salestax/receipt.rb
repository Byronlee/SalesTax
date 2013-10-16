class  Receipt
  attr_reader :basket

  def initialize(basket)
    @basket = basket
  end

  def items
    self.basket.items.map do |item|
      { 
        amount: item.amount, 
        goods_name: item.goods.name,
        price_after_tax: sprintf('%.2f', item.price_after_tax)
      }
    end
  end

  def sales_taxes
    result = self.basket.items.inject(0) do | total, item |
      total += item.total_taxes
    end
    sprintf('%.2f', result)
  end

  def total
    result = self.basket.items.inject(0) do | total, item |
      total += item.price_after_tax
    end
    sprintf('%.2f', result)
  end
  
end
