# Card
class Card
  attr_reader :number, :suit

  SUITS = %i[S H C D].freeze

  def self.convert(str)
    suit = str[-1].to_sym
    num = str[0...-1].to_i
    Card.new(num, suit)
  end

  def initialize(number, suit)
    raise ArgumentError unless num_valid?(number)
    @number = number
    raise ArgumentError unless suit_valid?(suit)
    @suit = suit
  end

  def compare(card)
    card.number == number
  end

  def suit_valid?(suit)
    SUITS.include?(suit)
  end

  def num_valid?(num)
    num.between?(1, 13)
  end
end
