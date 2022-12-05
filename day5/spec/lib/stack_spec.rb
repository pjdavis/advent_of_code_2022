# frozen_string_literal: true

require_relative '../../lib/crate'
require_relative '../../lib/stack'

RSpec.describe Stack do
  describe '.new' do
    it 'creates a stack with a name' do
      stack = Stack.new(name: 1)
      expect(stack.name).to eq(1)
    end
  end

  describe '#add_crates' do
    context 'with a single crate' do
      it 'adds the crate to the list of crates' do
        crate = Crate.new(name: 'A')
        stack = Stack.new(name: 1)
        stack.add_crates(crate)
        expect(stack.crates).to include(crate)
      end
    end
    context 'with multiple crates' do
      it 'adds the crates to the list of crates' do
        crates = [Crate.new(name: 'A'), Crate.new(name: 'B')]
        stack = Stack.new(name: 1)
        stack.add_crates(crates)
        expect(stack.crates).to include(*crates)
      end
    end
  end

  describe '#pop' do
    context 'with no amount' do
      it 'removes the top crate from a stack' do
        crates = [Crate.new(name: 'A'), Crate.new(name: 'B')]
        stack = Stack.new(name: 1)
        stack.add_crates(crates)
        stack.pop
        expect(stack.crates).not_to include(crates.last)
      end
      it 'returns the top crate from a stack' do
        crates = [Crate.new(name: 'A'), Crate.new(name: 'B')]
        stack = Stack.new(name: 1)
        stack.add_crates(crates)
        expect(stack.pop).to eq(crates.last)
      end
    end
    context 'with an amount' do
      it 'removes the top x crates from a stack' do
        crates = [Crate.new(name: 'A'), Crate.new(name: 'B'), Crate.new(name: 'C')]
        stack = Stack.new(name: 1)
        stack.add_crates(crates)
        stack.pop(2)
        expect(stack.crates).not_to include(*crates[-2,2])
      end
      it 'returns the top x crates from a stack' do
        crates = [Crate.new(name: 'A'), Crate.new(name: 'B'), Crate.new(name: 'C')]
        stack = Stack.new(name: 1)
        stack.add_crates(crates)
        expect(stack.pop(2)).to eq(crates[-2,2])
      end
    end
  end

  describe '#peek' do
    context 'with no amount' do
      it 'returns the top crate' do
        crates = [Crate.new(name: 'A'), Crate.new(name: 'B'), Crate.new(name: 'C')]
        stack = Stack.new(name: 1)
        stack.add_crates(crates)
        expect(stack.peek).to eq(crates.last)
      end
      it 'does not remove the crate' do
        crates = [Crate.new(name: 'A'), Crate.new(name: 'B'), Crate.new(name: 'C')]
        stack = Stack.new(name: 1)
        stack.add_crates(crates)
        stack.peek
        expect(stack.crates).to eq(crates)
      end
    end
    context 'with x amount' do
      it 'returns the top x crates' do
        crates = [Crate.new(name: 'A'), Crate.new(name: 'B'), Crate.new(name: 'C')]
        stack = Stack.new(name: 1)
        stack.add_crates(crates)
        expect(stack.peek(2)).to eq(crates[-2, 2])
      end
      it 'does not remove the crates' do
        crates = [Crate.new(name: 'A'), Crate.new(name: 'B'), Crate.new(name: 'C')]
        stack = Stack.new(name: 1)
        stack.add_crates(crates)
        stack.peek(2)
        expect(stack.crates).to eq(crates)
      end
    end
  end
end
