# frozen_string_literal: true

class Stack
  attr_reader :name, :crates

  def initialize(name:)
    @name = name
    @crates = []
  end

  def add_crates(crates)
    @crates += crates.is_a?(Array) ? crates : [crates]
  end

  alias :push :add_crates

  def pop(*args)
    if args.empty?
      @crates.pop
    else
      @crates.pop(args.first)
    end
  end

  def peek(*args)
    if args.empty?
      @crates.last
    else
      @crates[(args.first * -1), args.first]
    end
  end
end
