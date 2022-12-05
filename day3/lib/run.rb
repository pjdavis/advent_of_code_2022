# frozen_string_literal: true

require_relative 'group'
require_relative 'rucksack'

class Run
  attr_reader :output, :output2

  def initialize(input:)
    @file = File.open(input).readlines.map(&:chomp)
    @rucksacks = @file.map { |line| Rucksack.new(items: line) }
    @groups = @file.each_slice(3).to_a.map { |groups| Group.new(item_groups: groups) }
  end

  def run
    @output = 0
    @rucksacks.each_with_index do |rucksack, index|
      common_items = rucksack.common_items
      common_priority = rucksack.common_items.map(&:priority)
      # puts "Rucksack #{index + 1} has #{common_items.map(&:value).join(', ')} items in common, giving a value of #{common_priority} or #{common_priority.sum} in total."
      @output += rucksack.common_items.map(&:priority).sum
    end
    @output
  end

  def run2
    @output2 = 0
    @groups.each_with_index do |group, index|
      common_items = group.common_items
      common_priority = group.common_items.map(&:priority)
      puts "Group #{index + 1} #{common_items.map(&:value).join(', ')} items in common, giving a value of #{common_priority} or #{common_priority.sum} in total."
      @output2 += group.common_items.map(&:priority).sum
    end
    @output2
  end

end
