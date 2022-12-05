require_relative '../../lib/game_config'

RSpec.describe GameConfig do
  let(:config_file) { File.open("#{RSPEC_ROOT}/fixtures/config.yml") }
  describe '.new' do
    context 'without config file' do
      it 'raises an error' do
        expect { GameConfig.new }.to raise_error(ArgumentError)
      end
    end

    context 'with a nil config file' do
      it 'raises an error' do
        expect { GameConfig.new(config: nil) }.to raise_error(ArgumentError)
      end
    end

    context 'with a config file' do
      it 'returns a game config instance' do
        expect(GameConfig.new(config: config_file)).to be_a(GameConfig)
      end
    end

    context 'with a config hash' do
      it 'returns a game config instance' do
        config = { game: 'Rock Paper Scissors', moves: [{ value: 'Rock', symbols: ['R'], beats: nil, score: 1 }] }
        expect(GameConfig.new(config:)).to be_a(GameConfig)
      end
    end
  end

  describe '#name' do
    it 'returns the name of the game' do
      game_config = GameConfig.new(config: config_file)
      expect(game_config.name).to eq('Rock Paper Scissors')
    end
  end

  describe '#available_moves' do
    it 'returns an array of available moves for the game' do
      game_config = GameConfig.new(config: config_file)
      expect(game_config.available_moves).to be_an(Array)
    end

    it 'has the moves from the config' do
      config = { game: 'Rock Paper Scissors', moves: [{ value: 'Rock', symbols: ['R'], beats: nil, score: 1 }] }
      game_config = GameConfig.new(config: config)
      expect(game_config.available_moves).to include(Move.new(value: 'Rock'))
    end
  end

  describe '#move_mapper' do
    it 'returns the move mapper' do
      config = { game: 'Rock Paper Scissors', moves: [{ value: 'Rock', symbols: ['R'], beats: nil, score: 1 }] }
      game_config = GameConfig.new(config: config)
      expect(game_config.move_mapper).to be_a(MoveMapper)
    end
    it 'contains the right mapped moves' do
      config = { game: 'Rock Paper Scissors', moves: [{ value: 'Rock', symbols: ['R'], beats: nil, score: 1 }] }
      game_config = GameConfig.new(config: config)
      move = game_config.available_moves.first
      expect(game_config.move_mapper.move_for('R')).to eq(move)
    end
  end
end
