# frozen_string_literal: true

class Instruction
  PARSE_REGEX = %r(move (\d+) from (\d+) to (\d+))

  attr_reader :count, :from, :to

  def initialize(instruction:)
    puts instruction
    parsed = instruction.match(PARSE_REGEX)
    @count = parsed[1].to_i
    @from = parsed[2]
    @to = parsed[3]
  end
end
