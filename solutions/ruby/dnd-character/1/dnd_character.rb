=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter
  attr_reader :strength, :dexterity, :constitution,
              :intelligence, :wisdom, :charisma

  def self.modifier(constitution)
    ((constitution - 10).to_f / 2).floor
  end

  def initialize
    @strength = generate_ability_points
    @dexterity = generate_ability_points
    @constitution = generate_ability_points
    @intelligence = generate_ability_points
    @wisdom = generate_ability_points
    @charisma = generate_ability_points
  end

  def hitpoints
    ((constitution - 10).to_f / 2).floor + 10
  end

  private

  def generate_ability_points
    rolls = []
    4.times { rolls << dice_roll }
    min_roll = rolls.min
    rolls.sum - min_roll
  end

  def dice_roll
    rand(1..6)
  end
end
