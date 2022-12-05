# frozen_string_literal: true

class Crate
  attr_reader :name

  def initialize(name:)
    @name = name
  end
end
