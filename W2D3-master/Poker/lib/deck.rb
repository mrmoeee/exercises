require 'card'
# Deck
class Deck
  attr_reader :cards

  def self.build_deck
    cards = []
    Card::SUITS.each do |suit|
      13.times { |n| cards << Card.new(n + 1, suit) }
    end
    Deck.new(cards)
  end

  def initialize(cards)
    @cards = cards
  end

  def shuffle
    @cards.shuffle!
  end

  def add(add_cards)
    @cards.concat(add_cards)
  end

  def deal(count)
    return_cards = []
    count.times { return_cards << cards.shift }
    return_cards
  end

  def replace_cards(discarded_arr)
    add(discarded_arr)
    deal(discarded_arr.length)
  end
end
