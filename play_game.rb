require_relative './game.rb'

puts "                                ".colorize(:color => :red, :background => :white)
puts "  ===========================   ".colorize(:color => :red, :background => :white)
puts "  !!!WELCOME TO CHESS GAME!!!   ".colorize(:color => :red, :background => :white)
puts "  ===========================   ".colorize(:color => :red, :background => :white)
puts "                                ".colorize(:color => :red, :background => :white)
sleep(2)

game = Game.new
game.start_game