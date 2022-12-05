# frozen_string_literal: true

require_relative 'item'

class Rucksack

  attr_reader :compartments, :items

  def initialize(items:, compartments: 2)
    @items = items.each_char.to_a.map { |value| Item.new(value: value) }
    @compartments = compartments
    distribute_items
  end

  def common_items
    union = nil
    0.upto(@compartments.size - 2) do |index|
      # For some reason, the intersection wasn't picking up the common objects
      # when they were used as _value_objects_, so decompose them back to their
      # values, then recreate the value object at the end.
      union = @compartments[index].map(&:value) & @compartments[index + 1].map(&:value)
    end
    union.map { |v| Item.new(value: v) }
  end

  private

  def distribute_items
    @compartments = @items.each_slice(per_compartment).to_a
  end

  def per_compartment
    (@items.size.to_f / @compartments.to_f).ceil
  end
end
