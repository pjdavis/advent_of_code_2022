# frozen_string_literal: true

class Item
  PRIORITY_MAP = (('a'..'z').to_a + ('A'..'Z').to_a).freeze

  attr_reader :value

  def initialize(value:)
    raise ArgumentError if value.nil?

    @value = value
  end

  def priority
    PRIORITY_MAP.index(@value) + 1
  end

  def ==(other)
    value == other.value
  end

  alias :eql? :==
end
