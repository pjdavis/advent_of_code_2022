require_relative 'lib/run'
infile = ARGV.shift
runner = Run.new(input: infile)
runner.run
puts runner.output

runner.run2
puts runner.output2
