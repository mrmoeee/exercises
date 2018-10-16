require 'card'
# Hand
class Hand
  attr_reader :cards
  def initialize(cards)
    @cards = card_hash(cards)
  end

  def card_hash(cards)
    hsh = Hash.new { |h, key| h[key] = [] }
    cards.each do |card|
      hsh[card.number] << card
    end
    hsh
  end

  def to_s
    str = []
    @cards.each_value do |card_arr|
      card_arr.each do |card|
        str << "#{card.number} #{card.suit}"
      end
    end
    str.join(' | ')
  end

  def compare_hands(hand)
    current_hand <=> hand.current_hand
  end

  def current_hand
    case true
    when straight_flush
      7
    when flush
      6
    when straight
      5
    when four_of_a_kind
      4
    when three_of_a_kind
      3
    when pair
      2
    else
      1
    end
  end

  def straight_flush
    straight && flush
  end

  def straight
    prev = nil
    cards.keys.sort.each do |k|
      return false if prev && prev + 1 != k
      prev = k
    end
    true
  end

  def flush
    suits = Array.new(4, 0)
    cards.each_value do |card_arr|
      card_arr.each do |card|
        suits[Card::SUITS.index(card.suit)] += 1
      end
    end
    suits.max == 5
  end

  def pair
    cards.pair_count == 2
  end

  def three_of_a_kind
    cards.pair_count == 3
  end

  def four_of_a_kind
    cards.pair_count == 4
  end

  def pair_count
    count = 0
    cards.each_value do |val|
      count = val.length if val.length > count
    end
    count
  end
end
