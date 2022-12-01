require_relative 'elf'

class FoodImport
  def initialize(input_file:)
    raise ArgumentError, "input_file must be a path to import file" if input_file.nil?

    @import_file = input_file
    @elves = []
  end

  def import
    food_per_elf.each do |elf_id, inventory|
      elf = Elf.new(elf_id:)
      inventory.each do |cal|
        elf.add_calories_of_food(cal)
      end
      @elves << elf
    end
    @elves
  end

  def max(count: 1)
    @elves.map(&:calories).sort.reverse.take(count).sum
  end

  private

  def food_per_elf
    elf_inventory = {}
    split_inventories.each_with_index do |inventory, index|
      elf_inventory[index] = inventory
    end
    elf_inventory
  end

  def split_inventories
    food_raw = File.open(@import_file).read
    food_raw.split("\n\n").map { |inv| inv.split("\n") }
  end
end

