# frozen_string_literal: true

class Move
  InvalidValueError = Class.new(StandardError)

  attr_reader :value, :score, :beats

  def initialize(value:, score: 0, beats: [])
    raise InvalidValueError if value.nil?

    @value = value
    @score = score
    @beats = beats.is_a?(Array) ? beats.map { |b| Move.new(value: b) } : [beats].compact.map { |b| Move.new(value: b)}
  end

  def ==(other)
    value == other.value
  end

  alias :eql? :==

end
