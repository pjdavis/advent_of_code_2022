# frozen_string_literal: true

require 'forwardable'
require_relative 'game_config'

class Game
  extend Forwardable
  DoubleConfigureError = Class.new(StandardError)
  NoPlayersError = Class.new(StandardError)
  MoveMismatchError = Class.new(StandardError)

  def_delegators :@game_config, :move_mapper

  attr_reader :players, :scores

  def initialize(config: nil)
    load_config(config) unless config.nil?
    @players = []
    @scores = Hash.new { |h, k| h[k] = 0 }
  end

  def run(iterations: max_rounds)
    iterations.times do |iteration|
      moves = {}
      players.each do |player|
        moves[player] = move_mapper.move_for(player.move(iteration))
      end
      moves.each do |player, move|
        score = move.score
        moves.except(player).each_value do |other_move|
          score += if move.beats.include?(other_move)
                     6
                   elsif other_move.beats.include?(move)
                     0
                   elsif other_move == move
                     3
                   else
                     raise MoveMismatchError
                   end
        end
        @scores[player] += score
      end
    end
    @scores
  end

  def add_player(player)
    @players += player.is_a?(Array) ? player : [player]
  end

  alias add_players add_player

  def max_rounds
    raise NoPlayersError if @players.empty?

    @players.map(&:available_moves).min
  end

  def configure(config:)
    raise ArgumentError, 'config: must not be nil' if config.nil?
    raise DoubleConfigureError, 'game is already configured' if configured?

    load_config(config)
  end

  def configured?
    !@game_config.nil?
  end

  private

  def load_config(config)
    @game_config = case config
                   when Hash, String, File
                     GameConfig.new(config:)
                   when GameConfig
                     config
                   end
  end
end
