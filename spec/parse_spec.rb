require 'spec_helper'

module Salestax
  describe Parser do
    
    context "when the file not found" do
      it "should throw a exception" do

        parser = Parser.new("input1.data", "output1")
        expect{ parser.open_file }.to raise_error(NotFoundData)
      end
    end

    context "#parse" do
      before :each do 
        @parser = Parser.new(File.expand_path("../fixtures/input1.data", __FILE__).to_s, File.expand_path("../fixtures/output1.data", __FILE__).to_s) 
      end
      it "#parse_item should get some basket items after process" do
        @parser.open_file
        @parser.process { |first_step| first_step.parse_items }.material.first.should be_instance_of(BasketItem)
      end

      it "#make_basket should get a basket after process" do
        
        @parser.open_file
        @parser.process { |first_step| first_step.send(:parse_items) }
               .process { |second_step| second_step.send(:make_basket) }

        @parser.material.should be_instance_of(Basket)

      end

      it "write_file should save the result in a file" do
        @parser.open_file
        @parser.process { |first_step| first_step.send(:parse_items) }
          .process { |second_step| second_step.send(:make_basket) }
          .process { |third_step| third_step.send(:make_receipt) }
          .process { |forth_step| forth_step.send(:write_file) }
      end

    end
  end
end
