# frozen_string_literal: true

class MoveMapper
  def initialize
    @move_map = {}
  end

  def add_move(move:, symbol:)
    symbols = symbol.is_a?(Array) ? symbol : [symbol]
    symbols.each do |s|
      @move_map[s] = move
    end
  end

  def move_for(symbol)
    @move_map.fetch(symbol)
  end
end
