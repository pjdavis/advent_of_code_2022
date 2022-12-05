# frozen_string_literal: true

require_relative '../../lib/player'

RSpec.describe Player do
  describe '.new' do
    context 'without name' do
      it 'raises an error' do
        expect { Player.new }.to raise_error(ArgumentError)
      end
    end

    context 'with a name' do
      it 'returns a Player instance' do
        expect(Player.new(name: 'Player 1')).to be_a(Player)
      end
    end
  end

  describe '#name' do
    it 'returns the players name' do
      player = Player.new(name: 'Player 1')
      expect(player.name).to eq('Player 1')
    end
  end

  describe '#add_moves' do
    context 'with an array' do
      it 'adds the moves' do
        moves = %w[R P S]
        player = Player.new(name: 'Player 1')
        player.add_moves(moves)
        expect(player.moves).to eq moves
      end
    end
    context 'with a single move' do
      it 'adds the move' do
        player = Player.new(name: 'Player 1')
        player.add_moves('R')
        expect(player.moves).to eq ['R']
      end
    end
  end

  describe '#available_moves' do
    it 'returns the number of available moves' do
      player = Player.new(name: 'Player 1')
      player.add_moves(%w[R R S P R])
      expect(player.available_moves).to eq(5)
    end
  end

  describe '#move' do
    context 'with a move that is in bounds' do
      it 'returns the move' do
        player = Player.new(name: 'Player 1')
        player.add_moves(%w[R S P P P])
        expect(player.move(2)).to eq('P')
      end
    end
    context 'with a move that is out of bounds' do
      it 'raises an error' do
        player = Player.new(name: 'Player 1')
        player.add_moves('R')
        expect { player.move(2) }.to raise_error(IndexError)
      end
    end
  end
end
