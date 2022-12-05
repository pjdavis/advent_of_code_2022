# frozen_string_literal: true

require_relative '../../lib/item'

RSpec.describe Item do
  describe '#value' do
    it 'returns the set value' do
      item = Item.new(value: 'A')
      expect(item.value).to eq('A')
    end
  end

  describe '#==' do
    context 'with another item with the same value' do
      it 'is equal' do
        item = Item.new(value: 'A')
        other = Item.new(value: 'A')
        expect(item).to eq(other)
      end
    end
    context 'with another item with a different value' do
      it 'is not equal' do
        item = Item.new(value: 'A')
        other = Item.new(value: 'B')
        expect(item).not_to eq(other)
      end
    end
    context 'bugs' do
      context 'p' do
        it 'is equal' do
          item = Item.new(value: 'p')
          other = Item.new(value: 'p')
          expect(item).to eq(other)
        end
      end
    end
  end

  describe '#priority' do
    (('a'..'z').to_a + ('A'..'Z').to_a).each_with_index do |char, index|
      context "with a value of #{char}" do
        it "has a priority of #{index + 1}" do
          expect(Item.new(value: char).priority).to eq(index + 1)
        end
      end
    end
  end
end
