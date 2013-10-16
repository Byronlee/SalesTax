module Salestax
  class Basket

    attr_accessor :goodses, :items

    def initialize
      @goodses = []
      @items = []
    end

    def add_item(item)7
      self.items << item
    end

    def remove_item(item)
      sefl.items.delete item
    end
  end
end
