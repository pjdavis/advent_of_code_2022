# frozen_string_literal: true

class Datastream
  def initialize(buffer:)
    @buffer = buffer
  end

  def start_of_packet
    marker(4)
  end

  def start_of_message
    marker(14)
  end

  private
  def marker(distinct_flag)
    0.upto(@buffer.length) do |index|
      return index + distinct_flag if @buffer[index, distinct_flag].chars.uniq.length == distinct_flag
    end
  end
end
