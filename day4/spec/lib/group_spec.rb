# frozen_string_literal: true

require_relative '../../lib/group'

RSpec.describe Group do
  describe '#overlapped?' do
    context 'with a overlapping b' do
      it 'returns true' do
        group = Group.new(assignments: '2-8,3-7')
        expect(group.overlapped?).to be(true)
      end
    end
    context 'with b overlapping a' do
      it 'returns true' do
        group = Group.new(assignments: '3-7,2-8')
        expect(group.overlapped?).to be(true)
      end
    end
    context 'with no overlap' do
      it 'returns false' do
        group = Group.new(assignments: '1-2,4-5')
        expect(group.overlapped?).to be(false)
      end
    end
  end
end
