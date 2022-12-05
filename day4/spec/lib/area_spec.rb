# frozen_string_literal: true

require_relative '../../lib/area'

RSpec.describe Area do
  describe '#range' do
    it 'returns the contents as a range' do
      area = Area.new(contents: '1-5')
      expect(area.range).to eq(1..5)
    end
    it 'works with same number ranges' do
      area = Area.new(contents: '2-2')
      expect(area.range).to eq(2..2)
    end
  end
  describe '#fully_contains' do
    context 'with a fully-contained area' do
      it 'returns true' do
        area = Area.new(contents: '2-6')
        other = Area.new(contents: '3-5')
        expect(area.fully_contains?(other)).to be true
      end
    end
    context 'with a name number range' do
      it 'returns true' do
        area = Area.new(contents: '1-4')
        other = Area.new(contents: '2-2')
        expect(area.fully_contains?(other)).to be true
      end
    end
    context 'with a partially-contained area' do
      it 'returns false' do
        area = Area.new(contents: '2-4')
        other = Area.new(contents: '3-7')
        expect(area.fully_contains?(other)).to be false
      end
    end
    context 'with a not-contained area' do
      it 'returns false' do
        area = Area.new(contents: '2-4')
        other = Area.new(contents: '6-7')
        expect(area.fully_contains?(other)).to be false
      end
    end
  end
  describe '#partially_contains?' do
    context 'with a fully-contained area' do
      it 'returns true' do
        area = Area.new(contents: '2-6')
        other = Area.new(contents: '3-5')
        expect(area.partially_contains?(other)).to be true
      end
    end
    context 'with a single-number range' do
      it 'returns true' do
        area = Area.new(contents: '1-4')
        other = Area.new(contents: '2-2')
        expect(area.partially_contains?(other)).to be true
      end
    end
    context 'with a partially-contained area' do
      it 'returns true' do
        area = Area.new(contents: '2-4')
        other = Area.new(contents: '3-7')
        expect(area.partially_contains?(other)).to be true
      end
    end
    context 'with a not-contained area' do
      it 'returns false' do
        area = Area.new(contents: '2-4')
        other = Area.new(contents: '6-7')
        expect(area.partially_contains?(other)).to be false
      end
    end
  end
end
