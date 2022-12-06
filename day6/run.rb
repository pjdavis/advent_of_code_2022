# frozen_string_literal: true

require_relative 'lib/run'

runner = Run.new(input_file: ARGV.shift)
runner.run
puts runner.output
runner.run2
puts runner.output2
