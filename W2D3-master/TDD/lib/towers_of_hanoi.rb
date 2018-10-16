class Game
  attr_reader :towers
  def self.create_towers
    towers = Array.new(3) { [] }
    7.times { |n| towers.first << (n + 1) }
    towers.first.reverse!
    Game.new(towers)
  end
  
  def initialize(towers)
    @towers = towers    
  end
  
  def play
    puts "Let's play Towerzzzz of Hanoi!"
    until won?
      p_from, p_to = get_input
      move(p_from, p_to) if valid_move?(p_from, p_to)
    end
    puts "You won, finally!"
  end
  
  # private
  
  def valid_move?(p_from, p_to)
    return false if towers[p_from].empty?
    unless towers[p_to].empty? || towers[p_from].empty?
      return false if towers[p_to].last < towers[p_from].last
    end
    true
  end
  def get_input
    puts "What tower from?"
    pile = gets.chomp.to_i
    puts "What tower go?"
    pile_go = gets.chomp.to_i
    [pile, pile_go]
  end

  def won?
    return true if towers[1].length == 7
    return true if towers[2].length == 7
    false
  end
  
  def move(p_from, p_to)
    dissscck = towers[p_from].pop
    towers[p_to] << dissscck
  end
end

# game = Game.create_towers
# game.play