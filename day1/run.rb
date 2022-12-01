require_relative 'lib/food_import'

input_file_path = ARGV.shift
input_file = File.open(input_file_path)

import = FoodImport.new(input_file: )
import.import
puts "Top Food: #{import.max}"
puts "Top 3 Food: #{import.max(count: 3)}"
