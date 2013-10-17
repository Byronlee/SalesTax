# -*- coding: utf-8 -*-
require 'yaml'

module Salestax
  module TaxRule
    class TaxRuleEngine
      attr_reader :tax_rates      

      def initialize 
        YAML.load(tax_rule_define_file).each do |rule|
          self.add_tax_rate create_tax_rate(rule[1])
        end
      end
     
      def rule_for object
        (@object = object) && self
      end
      
      # TODO 这个算法可以改善，当scope是all的时候特殊处理，这时就要处理特殊的情况了，如税之间的互斥性，有了，no basic税　就没有 0.01
      def execute_rule rule
        rule.scope.each do | item |
          p @object.name
          p item
          return true if @object.name.include? item
        end
        false
      end
      
      def filter
        p @tax_rates
        @tax_rates.clone.select{|rule| p execute_rule(rule)}
      end

      def add_tax_rate tax_rate
        (@tax_rates ||= [])  << tax_rate
      end

      private 
      
      def tax_rule_define_file
        begin 
          File.open(File.expand_path("./../tax_rule_define.yml", __FILE__))
        rescue Exception
          raise "not found this file named tax_rule_define.yml"
        end
      end

      def create_tax_rate attrs
        TaxRate.new(attrs["name"],attrs["rate"],attrs["scope"])
      end

      
      #TO DO
      # define some help method change tax_rate or tax_rate`s attr
      # eg: @engin.send(:tax_name).rate/name = ?
      # eg: @engin.replace_tax(:tax_name) 
      # eg: @engin.add/remove(:tax_name)
    end
  end
end
