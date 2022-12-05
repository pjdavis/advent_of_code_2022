require_relative '../../lib/move'

RSpec.describe Move do
  describe '.new' do
    context 'with value' do
      it 'returns a Move object' do
        move = Move.new(value: :rock)
        expect(move).to be_a(Move)
      end
    end
    context 'without a value' do
      it 'raises an error' do
        expect { Move.new }.to raise_error(ArgumentError)
      end
    end
    context 'with a nil value' do
      it 'raises an error' do
        expect { Move.new(value: nil) }.to raise_error(Move::InvalidValueError)
      end
    end
  end

  describe '#value' do
    it 'returns the set value' do
      move = Move.new(value: :paper)
      expect(move.value).to eq(:paper)
    end
  end

  describe '#==' do
    context 'with another of the same move value' do
      it 'returns true' do
        move = Move.new(value: :scissors)
        other = Move.new(value: :scissors)
        expect(move).to eq(other)
      end
    end
    context 'with another of a different value' do
      it 'returns false' do
        move = Move.new(value: :scissors)
        other = Move.new(value: :paper)
        expect(move).not_to eq(other)
      end
    end
  end

  describe '#eql?' do
    context 'with another of the same move value' do
      it 'returns true' do
        move = Move.new(value: :scissors)
        other = Move.new(value: :scissors)
        expect(move).to be_eql(other)
      end
    end
    context 'with another of a different value' do
      it 'returns false' do
        move = Move.new(value: :scissors)
        other = Move.new(value: :paper)
        expect(move).not_to be_eql(other)
      end
    end
  end

  describe '#equal?' do
    context 'with itself' do
      it 'returns true' do
        move = Move.new(value: :scissors)
        expect(move).to be_equal(move)
      end
    end
    context 'with another of the same move value' do
      it 'returns false' do
        move = Move.new(value: :scissors)
        other = Move.new(value: :scissors)
        expect(move).not_to be_equal(other)
      end
    end
  end

  describe '#score' do
    context 'when initialized with a score' do
      it 'returns the score' do
        move = Move.new(value: :rock, score: 3)
        expect(move.score).to eq(3)
      end
    end
    context 'when initialized wihtout a score' do
      it 'returns 0' do
        move = Move.new(value: :paper)
        expect(move.score).to eq(0)
      end
    end
  end

  describe '#beats' do
    context 'when initialized with beats array' do
      it 'returns the beats array' do
        move = Move.new(value: :paper, beats: [:rock])
        beat_move = Move.new(value: :rock)
        expect(move.beats).to eq([beat_move])
      end
    end

    context 'when initialized with beats element' do
      it 'returns the beats element in an array' do
        move = Move.new(value: :paper, beats: :rock)
        beat_move = Move.new(value: :rock)
        expect(move.beats).to eq([beat_move])
      end
    end
  end
end
