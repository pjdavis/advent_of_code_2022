# frozen_string_literal: true

require_relative '../../lib/player_loader'

RSpec.describe PlayerLoader do
  let(:player_file) { File.open("#{RSPEC_ROOT}/fixtures/play_file.txt") }
  describe '.new' do
    context 'without config file' do
      it 'raises an error' do
        expect { PlayerLoader.new }.to raise_error(ArgumentError)
      end
    end

    context 'with a nil config file' do
      it 'raises an error' do
        expect { PlayerLoader.new(config: nil) }.to raise_error(ArgumentError)
      end
    end

    context 'with a config file' do
      it 'returns a PlayerLoader instance' do
        expect(PlayerLoader.new(config: player_file)).to be_a(PlayerLoader)
      end
    end
  end

  describe '#players' do
    it 'has the same number of players as the config file' do
      player_loader = PlayerLoader.new(config: player_file)
      expect(player_loader.players.size).to eq(2)
    end

    it 'contains players' do
      player_loader = PlayerLoader.new(config: player_file)
      expect(player_loader.players).to all(be_a(Player))
    end

    it 'populates the player moves' do
      player_loader = PlayerLoader.new(config: player_file)
      first_player = player_loader.players.first
      expect(first_player.moves).to eq(%w[A B C])
    end
  end
end
