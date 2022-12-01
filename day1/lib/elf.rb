# frozen_string_literal: true

class Elf
  class << self; attr_accessor :instances; end

  attr_reader :calories, :id

  def self.all
    instances.nil? ? [] : instances.values
  end

  def self.find(elf_id)
    raise ArgumentError, 'Missing Param elf_id' if elf_id.nil?

    instances[elf_id]
  end

  def self.count
    instances.nil? ? 0: instances.size
  end

  def self.destroy_all
    self.instances = {}
  end

  def initialize(elf_id:)
    @id = elf_id
    @calories = 0

    self.class.instances ||= {}
    self.class.instances[elf_id] = self
  end

  def add_calories_of_food(calories)
    @calories += calories.to_i
  end
end
