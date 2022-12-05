require_relative '../../lib/rucksack'

describe Rucksack do
  describe '.new' do
    it 'distributes items evenly' do
      rucksack = Rucksack.new(items: 'abcdABCD')
      expect(rucksack.compartments.first.size).to eq(rucksack.compartments.last.size)
    end
    it 'creates items in compartments' do
      rucksack = Rucksack.new(items: 'asdfLKJH')
      expect(rucksack.compartments.first).to all(be_a(Item))
    end
  end

  describe '#items' do
    it 'returns an array of all items in the rucksack' do
      items = [Item.new(value: 'a'),
               Item.new(value: 'b'),
               Item.new(value: 'E'),
               Item.new(value: 'a')]
      rucksack = Rucksack.new(items: 'abEa')
      expect(rucksack.items).to eq(items)
    end
  end

  describe '#common_items' do
    context 'with 2 compartments' do
      it 'returns an array of the common items for this rucksack' do
        rucksack = Rucksack.new(items: 'abcdABcD')
        common_item = Item.new(value: 'c')
        expect(rucksack.common_items).to eq([common_item])
      end
    end
    context 'with 3 compartments' do
      it 'returns an array of the common items for this rucksack' do
        rucksack = Rucksack.new(items: 'abCABCdeC', compartments: 3)
        common_item = Item.new(value: 'C')
        expect(rucksack.common_items).to eq([common_item])
      end
    end
    context 'bugs' do
      context "with input 'wFJZTbRcnJCbpwpFccZCBfBvPzfpgfgzzWvjSzNP'" do
        it "returns 'p' as the common item" do
          rucksack = Rucksack.new(items: 'wFJZTbRcnJCbpwpFccZCBfBvPzfpgfgzzWvjSzNP')
          common_item = Item.new(value: 'p')
          expect(rucksack.common_items).to eq([common_item])
        end
      end
    end
  end
end
