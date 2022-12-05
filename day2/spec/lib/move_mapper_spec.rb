require_relative '../../lib/move_mapper'

RSpec.describe MoveMapper do
  describe '.new' do
    context 'with mappings' do
      it 'returns a MoveMapper instance' do
        move_mapper = MoveMapper.new
        expect(move_mapper).to be_a(MoveMapper)
      end
    end
  end
  describe '#add_move' do
    context 'with a single symbol' do
      it 'maps the move' do
        move_mapper = MoveMapper.new
        move_mapper.add_move(move: :rock, symbol: 'R')
        expect(move_mapper.move_for('R')).to eq(:rock)
      end
    end

    context 'with an array of symbols' do
      it 'maps the moves' do
        symbols = %w[R r]
        move_mapper = MoveMapper.new
        move_mapper.add_move(move: :rock, symbol: symbols)
        symbols.each do |symbol|
          expect(move_mapper.move_for(symbol)).to eq(:rock)
        end
      end
    end

    describe '#move_for' do
      context 'with a move that has been added' do
        it 'returns the move' do
          move_mapper = MoveMapper.new
          move_mapper.add_move(move: :paper, symbol: 'P')
          expect(move_mapper.move_for('P')).to eq(:paper)
        end
      end

      context 'with a move that has not been added' do
        it 'raises an error' do
          move_mapper = MoveMapper.new
          expect { move_mapper.move_for('P') }.to raise_error(KeyError)
        end
      end
    end
  end
end
