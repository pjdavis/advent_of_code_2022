# frozen_string_literal: true

require_relative '../../lib/group'

RSpec.describe Group do
  describe '.new' do
    it 'produces rucksacks for each item group' do
      group = Group.new(item_groups: ["abcABc", "aefDEf", "ahiGHi"])
      expect(group.rucksacks.size).to eq(3)
    end
  end

  describe '#common_items' do
    it 'returns an array of the common items between all rucksacks in the group' do
      items = ["aBaC", "bBEb", "RSRB"]
      group = Group.new(item_groups: items)
      expect(group.common_items).to eq([Item.new(value: 'B')])
    end
  end
end
