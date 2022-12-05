# frozen_string_literal: true

require_relative 'player'

class PlayerLoader

  attr_reader :players
  def initialize(config:)
    raise ArgumentError if config.nil?

    @config = config
    @players = []
    load_players
  end

  private

  def load_moves
    @load_moves ||= File.readlines(@config).map(&:split).transpose
  end

  def load_players
    load_moves.each_with_index do |moves, idx|
      player = Player.new(name: "Player #{idx}")
      player.add_moves(moves)
      @players << player
    end
  end
end
