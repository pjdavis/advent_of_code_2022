# frozen_string_literal: true

require_relative '../../lib/run'

RSpec.describe Run do
  describe '#output' do
    it 'gives the correct output' do
      runner = Run.new(input_file: "#{RSPEC_ROOT}/fixtures/data.txt")
      runner.run
      expect(runner.output).to eq(7)
    end
  end
  describe '#output2' do
    it 'gives the correct output' do
      runner = Run.new(input_file: "#{RSPEC_ROOT}/fixtures/data.txt")
      runner.run2
      expect(runner.output2).to eq(19)
    end
  end
end
