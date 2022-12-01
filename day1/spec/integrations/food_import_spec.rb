require_relative '../../lib/food_import'

RSpec.describe FoodImport do
  describe '.new' do
    context 'without an import file' do
      it 'raises an error' do
        expect { FoodImport.new }.to raise_error(ArgumentError)
      end
    end
    context 'with a nil import file' do
      it 'raises an error' do
        expect { FoodImport.new(input_file: nil) }.to raise_error(ArgumentError)
      end
    end
    context 'with an import file' do
      it 'returns a food import object' do
        import_file = File.open("#{RSPEC_ROOT}/fixtures/import_file.txt")
        expect(FoodImport.new(input_file: import_file)).to be_a(FoodImport)
      end
    end
  end
  describe '#import' do
    it 'returns the imported elves' do
      import_file = File.open("#{RSPEC_ROOT}/fixtures/import_file.txt")
      import = FoodImport.new(input_file: import_file)
      expect(import.import).to be_an(Array)
    end
  end
  describe '#max' do
    context 'without args' do
      it 'returns the max food of elves' do
        import_file = File.open("#{RSPEC_ROOT}/fixtures/import_file.txt")
        import = FoodImport.new(input_file: import_file)
        import.import
        expect(import.max).to eq(24000)
      end
    end
    context 'with top number arg' do
      it 'returns the total food of the top x elves' do
        import_file = File.open("#{RSPEC_ROOT}/fixtures/import_file.txt")
        import = FoodImport.new(input_file: import_file)
        import.import
        expect(import.max(count: 3)).to eq(45000)
      end
    end
  end
end
