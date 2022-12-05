# frozen_string_literal: true

require_relative '../../lib/crate'

RSpec.describe Crate do
  describe '.new' do
    it 'creates a crate with a name' do
      crate = Crate.new(name: 'name')
      expect(crate.name).to eq('name')
    end
  end
end
