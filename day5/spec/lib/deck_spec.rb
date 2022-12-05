# frozen_string_literal: true

require_relative '../../lib/crate'
require_relative '../../lib/stack'
require_relative '../../lib/deck'

RSpec.describe Deck do
  describe '#add_stack' do
    context 'when given a single stack' do
      it 'adds the stack to the list of stacks' do
        deck = Deck.new
        stack = Stack.new(name: 1)
        deck.add_stacks(stack)
        expect(deck.stacks).to include(stack)
      end
    end
    context 'when given an array of stacks' do
      it 'adds the stacks to the list of stacks' do
        deck = Deck.new
        stacks = [Stack.new(name: 1), Stack.new(name: 2)]
        deck.add_stacks(stacks)
        expect(deck.stacks).to include(*stacks)
      end
    end
  end
  describe '#top_crates' do
    it 'returns the top crates of each stack' do
      stack1 = Stack.new(name: '1')
      stack1.add_crates([Crate.new(name: 'A'), Crate.new(name: 'B')])
      stack2 = Stack.new(name: '2')
      stack2.add_crates([Crate.new(name: 'C'), Crate.new(name: 'D')])
      deck = Deck.new
      deck.add_stacks([stack1, stack2])
      expect(deck.top_crates.map(&:name)).to eq(['B', 'D'])
    end
  end
  describe '#execute!' do
    context 'with a single crate' do
      it 'moves a crate' do
        stack1 = Stack.new(name: '1')
        stack1.add_crates([Crate.new(name: 'A'), Crate.new(name: 'B')])
        stack2 = Stack.new(name: '2')
        stack2.add_crates([Crate.new(name: 'C'), Crate.new(name: 'D')])
        deck = Deck.new
        deck.add_stacks([stack1, stack2])
        instruction = Instruction.new(instruction: 'move 1 from 1 to 2')
        deck.execute!(instruction)
        expect(deck.top_crates.map(&:name)).to eq(['A', 'B'])
      end
    end
    context 'with multiple crates' do
      it 'moves crates one at a time' do
        stack1 = Stack.new(name: '1')
        stack1.add_crates([Crate.new(name: 'A'), Crate.new(name: 'B'), Crate.new(name: 'E')])
        stack2 = Stack.new(name: '2')
        stack2.add_crates([Crate.new(name: 'C'), Crate.new(name: 'D')])
        deck = Deck.new
        deck.add_stacks([stack1, stack2])
        instruction = Instruction.new(instruction: 'move 2 from 1 to 2')
        deck.execute!(instruction)
        expect(deck.top_crates.map(&:name)).to eq(['A', 'B'])
      end
    end
  end
end
