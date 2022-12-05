# frozen_string_literal: true

require_relative 'group'

class Run
  attr_reader :output, :output2

  def initialize(input:)
    @file = File.open(input).readlines.map(&:chomp)
    @groups = @file.map { |line| Group.new(assignments: line) }
  end

  def run
    @output = @groups.map(&:overlapped?).count(&:itself)
  end

  def run2
    @output2 = @groups.map(&:partially_overlapped?).count(&:itself)
  end
end
