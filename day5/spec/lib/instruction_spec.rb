# frozen_string_literal: true

require_relative '../../lib/instruction'

RSpec.describe Instruction do
  describe '.new' do
    it 'gives the number of crates' do
      instruction = Instruction.new(instruction: 'move 1 from 2 to 1')
      expect(instruction.count).to eq(1)
    end
    it 'gives the from stack' do
      instruction = Instruction.new(instruction: 'move 1 from 2 to 1')
      expect(instruction.from).to eq('2')
    end
    it 'gives the to stack' do
      instruction = Instruction.new(instruction: 'move 1 from 2 to 1')
      expect(instruction.to).to eq('1')
    end
  end
end
