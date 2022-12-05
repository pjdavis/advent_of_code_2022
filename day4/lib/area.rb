# frozen_string_literal: true

class Area
  attr_reader :range

  def initialize(contents:)
    raise ArgumentError if contents.nil?

    @range = contents.split('-').first.to_i..contents.split('-').last.to_i
  end

  def fully_contains?(other)
    @range.cover?(other.range)
  end

  def partially_contains?(other)
    (@range.first <= other.range.last) && (other.range.first <= @range.last)
  end
end
