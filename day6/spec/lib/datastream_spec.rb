# frozen_string_literal: true

require_relative '../../lib/datastream'

RSpec.describe Datastream do
  describe '#start_of_packet' do
    cases = {
      'mjqjpqmgbljsphdztnvjfqwrcgsmlb' => 7,
      'bvwbjplbgvbhsrlpgdmjqwftvncz' => 5,
      'nppdvjthqldpwncqszvftbrmjlhg' => 6,
      'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg' => 10,
      'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw' => 11
    }
    cases.each do |buffer, marker|
      it 'returns the index where there are 4 different characters' do
        datastream = Datastream.new(buffer: )
        expect(datastream.start_of_packet).to eq(marker)
      end
    end
  end
  describe '#start_of_message' do
    cases = {
      'mjqjpqmgbljsphdztnvjfqwrcgsmlb' => 19,
      'bvwbjplbgvbhsrlpgdmjqwftvncz' => 23,
      'nppdvjthqldpwncqszvftbrmjlhg' => 23,
      'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg' => 29,
      'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw' => 26
    }
    cases.each do |buffer, marker|
      it 'returns the index where there are 4 different characters' do
        datastream = Datastream.new(buffer: )
        expect(datastream.start_of_message).to eq(marker)
      end
    end
  end
end
