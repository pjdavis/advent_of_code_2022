require_relative '../../lib/elf'

RSpec.describe Elf do
  before do
    Elf.destroy_all
  end
  describe '.new' do
    context 'with an elf id' do
      it 'creates a new elf instance' do
        elf = Elf.new(elf_id: 1)
        expect(elf).to be_an(Elf)
      end

      it 'returns an id' do
        elf = Elf.new(elf_id: 20)
        expect(elf.id).to eq(20)
      end
    end
    context 'without an elf id' do
      it 'raises an error' do
        expect { Elf.new }.to raise_error(ArgumentError)
      end
    end
  end
  describe '.count' do
    context 'with no elves' do
      it 'returns the count of elves' do
        expect(Elf.count).to eq(0)
      end
    end
    context 'with elves' do
      it 'returns the count of elves' do
        Elf.new(elf_id: 1)
        expect(Elf.count).to eq(1)
      end
    end
  end
  describe '.all' do
    context 'with no elves' do
      it 'returns an empty array' do
        expect(Elf.all).to eq([])
      end
    end
    context 'with elves' do
      it 'returns an array of elves' do
        Elf.new(elf_id: 1)
        expect(Elf.all).to include(a_kind_of(Elf))
      end
    end
  end
  describe '.destroy_all' do
    it 'removes all elves' do
      Elf.new(elf_id: 1)
      expect { Elf.destroy_all }.to change { Elf.count }.to(0)
    end
  end
  describe '.find' do
    context 'without an elf id' do
      it 'raises an error' do
        expect { Elf.find(nil) }.to raise_error(ArgumentError)
      end
    end
    context 'with an elf id that exists' do
      it 'returns the elf with the provided id' do
        elf_id = 1
        elf = Elf.new(elf_id: elf_id)
        expect(Elf.find(elf_id)).to eq(elf)
      end
    end
    context 'with an elf id that does not exist' do
      it 'returns nil' do
        elf_id = 1
        expect(Elf.find(elf_id)).to be nil
      end
    end
  end
  describe '#add_calories_of_food' do
    context 'with an amount of calories as a number' do
      it 'increases the number of calories' do
        calories_added = 1000
        elf = Elf.new(elf_id: 1)
        expect { elf.add_calories_of_food(calories_added) }.to change { elf.calories }.by(calories_added)
      end
    end
    context 'with an amount of calories as a string' do
      it 'increases the number of calories' do
        calories_added = '1000'
        elf = Elf.new(elf_id: 1)
        expect { elf.add_calories_of_food(calories_added) }.to change { elf.calories }.by(calories_added.to_i)
      end
    end
    context 'with nil calories' do
      it 'does not increase the number of calories' do
        calories_added = nil
        elf = Elf.new(elf_id: 1)
        expect { elf.add_calories_of_food(calories_added) }.not_to change { elf.calories }
      end
    end
  end
  describe '#calories' do
    it 'returns the number of calories' do
      elf = Elf.new(elf_id: 1)
      elf.add_calories_of_food(1000)
      expect(elf.calories).to eq(1000)
    end
  end
end
