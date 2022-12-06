# frozen_string_literal: true

require_relative 'datastream'

class Run
  attr_reader :output, :output2

  def initialize(input_file:)
    @input_file = input_file
  end

  def run
    datastream = Datastream.new(buffer: input_buffer)
    @output = datastream.start_of_packet
  end

  def run2
    datastream = Datastream.new(buffer: input_buffer)
    @output2 = datastream.start_of_message
  end

  private

  def input_buffer
    File.open(@input_file).read
  end
end
