# frozen_string_literal: true

require_relative 'rucksack'

class Group
  attr_reader :rucksacks
  def initialize(item_groups:)
    @item_groups = item_groups
    @rucksacks = @item_groups.map { |items| Rucksack.new(items: items) }
  end

  def common_items
    first, *rest = *rucksacks
    first = first.items.map(&:value)
    rest = rest.map { |r| r.items.map(&:value) }

    first.intersection(*rest).map { |i| Item.new(value: i)}
  end
end
