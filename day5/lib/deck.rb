# frozen_string_literal: true

class Deck
  attr_reader :stacks

  def initialize
    @stacks = []
  end

  def add_stacks(stacks)
    @stacks += stacks.is_a?(Array) ? stacks : [stacks]
  end

  def top_crates
    @stacks.map(&:peek)
  end

  def execute!(instruction, multi = false)
    if multi
      crate = stack(instruction.from).pop(instruction.count)
      stack(instruction.to).push(crate)
    else
      instruction.count.times do
        crate = stack(instruction.from).pop
        stack(instruction.to).push(crate)
      end
    end
  end

  private

  def stack(name)
    @stacks.find { |stack| stack.name == name }
  end
end
