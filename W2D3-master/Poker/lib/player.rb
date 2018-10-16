require 'hand'
# Player
class Player
  attr_accessor :hand
  def initialize(name)
    @name = name
    @hand = nil
    @pot = 1000
  end

  def discard
    puts hand
    puts 'Would you like to discard any cards?'
    response = gets.chomp
    return [] if response.downcase == 'no'
    puts 'What cards would you like to discard?'
    discards = gets.chomp
    discards.split!
    discards.map { |str| Card.convert(str) }
    discards
  end

  def ask_move
    puts 'Fold? or See? or Raise?'
    decision = gets.chomp
    case decision.downcase
    when 'fold'
      #FOLD HAND
    when 'see'
      #check no bet add to pot
    when 'raise'
      #raise pot
    else
      raise ArgumentError
    end
  end


end
