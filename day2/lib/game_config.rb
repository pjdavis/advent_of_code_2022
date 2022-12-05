# frozen_string_literal: true

require 'yaml'
require_relative 'move'
require_relative 'move_mapper'

class GameConfig

  ConfigError = Class.new(StandardError)

  attr_reader :name, :available_moves, :move_mapper

  def initialize(config:)
    raise ArgumentError if config.nil?

    @raw_config = config
    load_config
  end

  private

  def configuration
    @configuration ||= case @raw_config
                       when Hash
                         @raw_config.transform_keys(&:to_sym)
                       when File
                         YAML.load(@raw_config).transform_keys(&:to_sym)
                       when String
                         YAML.load_file(@raw_config).transform_keys(&:to_sym)
                       else
                         raise ConfigError, "Config must be a Hash, File, or String"
                       end
  end

  def load_config
    @name = configuration[:game]
    @move_mapper = MoveMapper.new
    @available_moves = configuration[:moves].map do |move_config|
      move_config.transform_keys!(&:to_sym)
      move = Move.new(value: move_config[:value], score: move_config[:score], beats: move_config[:beats])
      @move_mapper.add_move(move:, symbol: move_config[:symbols])
      move
    end
  end
end
