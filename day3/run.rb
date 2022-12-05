require_relative 'lib/run'

infile = ARGV.shift

run = Run.new(input: infile)
run.run
puts run.output
run.run2
puts run.output2
