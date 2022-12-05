# frozen_string_literal: true

require_relative 'area'

class Group
  def initialize(assignments:)
    @areas = assignments.split(',').map { |contents| Area.new(contents:) }
  end

  def overlapped?
    @areas.first.fully_contains?(@areas.last) || @areas.last.fully_contains?(@areas.first)
  end

  def partially_overlapped?
    @areas.first.partially_contains?(@areas.last) ||
      @areas.last.partially_contains?(@areas.first)
  end
end
