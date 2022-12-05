# frozen_string_literal: true

require_relative '../../lib/game'

RSpec.describe Game do
  let(:config_file) { File.open("#{RSPEC_ROOT}/fixtures/config.yml") }

  describe '.new' do
    it 'returns a new Game instance' do
      expect(Game.new).to be_a(Game)
    end
  end

  describe '#configure' do
    context 'without a configuration' do
      it 'loads a new config' do
        game = Game.new
        game.configure(config: config_file)
        expect(game.configured?).to be true
      end
    end

    context 'with a loaded configuration' do
      it 'raises an error' do
        game = Game.new(config: config_file)
        expect { game.configure(config: config_file) }.to raise_error(Game::DoubleConfigureError)
      end
    end

    context 'with a nil configuration' do
      it 'raises an error' do
        game = Game.new
        expect { game.configure(config: nil) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#configured?' do
    context 'when configuration is present' do
      it 'returns true' do
        game = Game.new(config: config_file)
        expect(game.configured?).to be true
      end
    end
    context 'when configuration is not present' do
      it 'returns false' do
        game = Game.new
        expect(game.configured?).to be false
      end
    end
  end

  describe '#add_player' do
    context 'with a single player' do
      it 'adds a player' do
        player = double("player")
        game = Game.new
        game.add_player(player)
        expect(game.players).to eq([player])
      end
    end
    context 'with an array of players' do
      it 'adds all the players' do
        player1 = double("player")
        player2 = double("player")
        game = Game.new
        game.add_players([player1, player2])
        expect(game.players).to include(player1, player2)
      end
    end
  end

  describe '#max_rounds' do
    context 'with no players' do
      it 'raises an error' do
        game = Game.new
        expect { game.max_rounds }.to raise_error(Game::NoPlayersError)
      end
    end
    context 'with 1 player' do
      it 'returns the available moves of the player' do
        player = double("player", available_moves: 5)
        game = Game.new
        game.add_player(player)
        expect(game.max_rounds).to eq 5
      end
    end
    context 'with multiple players' do
      it 'returns the available rounds of the lowest player' do
        player1 = double("player1", available_moves: 5)
        player2 = double("player2", available_moves: 2)
        game = Game.new
        game.add_players([player1, player2])
        expect(game.max_rounds).to eq(2)
      end
    end
  end
end
