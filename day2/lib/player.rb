# frozen_string_literal: true

class Player
  attr_reader :name, :moves

  def initialize(name:)
    @name = name
    @moves = []
  end

  def add_moves(moves)
    moves = moves.is_a?(Array) ? moves : [moves]
    @moves += moves
  end

  def available_moves
    @moves.size
  end

  def move(number)
    @moves.fetch(number)
  end

end
