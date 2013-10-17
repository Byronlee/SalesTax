# -*- coding: utf-8 -*-
require "salestax/version"
require "salestax/rate_calculable"
require "salestax/goods"
require "salestax/tax_rate"
require "salestax/basket"
require "salestax/receipt"
require "salestax/TaxRule/tax_rule_engine"
require "salestax/calculator"
require "salestax/basket_item"


module Salestax
  class NotFoundData < Exception ; end
  
  class Parser
    REGULAR_ITEM = /\s*(\d+)\s*(.*)\s*at\s*([\d\.]+.$)/

    attr_reader :material

    def initialize(input_file_path, output_file_path)
      @input_file_path = input_file_path
      @output_file_path = output_file_path
      @basket = Basket.new
    end
    
    def open_file
      begin
        @data = File.open(@input_file_path)
      rescue Exception
        raise NotFoundData, "not found this input files"
      end
    end

    def parse 
      results = @data.map do |line|
        opts = REGULAR_ITEM.match(line).to_a[1..3]
      end
      yield results # todo 给个判断是否给出块
    end

    def parse_items
      basket_items = []
      parse do |results|
        results.each do |opts|
          goods = Goods.new(opts[1])
          basket_items << BasketItem.new(goods, opts[0], opts[2].to_f)
        end
      end

      @material = basket_items
    end
    
    def make_basket
      basket = Basket.new

      @material.each do |item|
        basket.add_item item
      end

      @material = basket
    end

    def make_receipt
      receipt = Receipt.new @material

      @material = receipt 
    end

    def write_file
      
      File.open(@output_file_path, "w+") do | file |
        @material.items.each do |m|
          file.puts "#{m[:amount]} #{m[:goods_name]}: #{m[:price_after_tax]}"
        end
        file.puts "Sales Taxes: #{material.sales_taxes}"
        file.puts "Total: #{material.total}"
      end
    end

    def process &blk
      blk.call self
      self
    end
  end

end



