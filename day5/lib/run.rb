# frozen_string_literal: true

require_relative 'deck'
require_relative 'instruction'
require_relative 'crate'
require_relative 'stack'

class Run
  attr_reader :output, :output2

  def initialize(input:)
    @file = File.open(input).readlines.map(&:chomp)
    create_deck
  end

  def run
    @instructions.each do |instruction|
      @deck.execute!(instruction)
    end
    @output = @deck.top_crates.map(&:name).join
  end

  def run2
    @instructions.each do |instruction|
      @deck.execute!(instruction, true)
    end
    @output2 = @deck.top_crates.map(&:name).join
  end

  private

  def create_deck
    split_index = @file.index("")
    crates = @file[0, split_index - 1].map { |s| s.each_char.to_a.each_slice(4).to_a.map(&:join).map(&:strip).map { |s| s.gsub(/\W/, '') }.map { |s| s.empty? ? nil : s } }.map { |c| c.fill(nil, c.size..2) }.transpose.map(&:reverse).map(&:compact)
    stacks = @file[split_index - 1].split(" ").map(&:strip)
    @instructions = @file.drop(split_index + 1).map { |i| Instruction.new(instruction: i) }
    mapped_stacks = stacks.each_with_index.map do |stack, index|
      s = Stack.new(name: stack)
      crates_array = crates[index].map { |c| Crate.new(name: c) }
      s.add_crates(crates_array)
      s
    end
    @deck = Deck.new
    @deck.add_stacks(mapped_stacks)
  end
end
