require "bundler/gem_tasks"
require "./lib/salestax"

task :default => [:input]

task :input do
  (1..3).each do |i|
    parser = Salestax::Parser.new(File.expand_path("./../data/input#{i}.data", __FILE__).to_s, 
                         File.expand_path("./../data/output#{i}.data", __FILE__).to_s)

    parser.open_file
    parser.process { |first_step| first_step.send(:parse_items) }
          .process { |second_step| second_step.send(:make_basket) }
          .process { |third_step| third_step.send(:make_receipt) }
          .process { |forth_step| forth_step.send(:write_file) }

  end
  
end
