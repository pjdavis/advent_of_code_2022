require_relative 'lib/player_loader'
require_relative 'lib/game'

player_config = File.open(ARGV.shift)

player_loader = PlayerLoader.new(config: player_config)

game_config = File.open(ARGV.shift)
game = Game.new(config: game_config)
game.add_players(player_loader.players)
game.run
game.scores.each do |k, v|
  puts "player: #{k.name} - #{v}"
end

move_sets = File.readlines(player_config).map(&:split)
score_table = {
  %w[A X] => 3,
  %w[A Y] => 4,
  %w[A Z] => 8,
  %w[B X] => 1,
  %w[B Y] => 5,
  %w[B Z] => 9,
  %w[C X] => 2,
  %w[C Y] => 6,
  %w[C Z] => 7
}
puts move_sets.map { |set| score_table[set] }.sum
