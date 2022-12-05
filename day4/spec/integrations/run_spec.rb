# frozen_string_literal: true

require_relative '../../lib/run'

RSpec.describe Run do
  describe '#run' do
    it 'produces the correct output' do
      runner = Run.new(input: "#{RSPEC_ROOT}/fixtures/input.txt")
      runner.run
      expect(runner.output).to eq(2)
    end
  end

  describe '#run2' do
    it 'produces the correct output' do
      runner = Run.new(input: "#{RSPEC_ROOT}/fixtures/input.txt")
      runner.run2
      expect(runner.output2).to eq(4)
    end
  end
end
