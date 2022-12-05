# frozen_string_literal: true

require_relative '../../lib/run'

RSpec.describe Run do
  describe '#run' do
    it 'produces the correct output' do
      runner = Run.new(input: "#{RSPEC_ROOT}/fixtures/data.txt")
      runner.run
      expect(runner.output).to eq('CMZ')
    end
  end
end
