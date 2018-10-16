# Game
class Game

  attr_reader :players, :deck
  def initialize(*players)
    @deck = Deck.build_deck
    @pot = 0
    @players = players
  end

  def run
    play_turn until won?

  end

  def give_hands
    players.each do |player|
      player.hand = deck.deal(5)
    end
  end

  def add_pot
    # players.each
  end

  def play_turn
    give_hands
    handle_discards
    add_pot
    handle_moves
    give_pot
  end

  def handle_discards
    players.each do |player|
      discards = player.discard
      player.hand -= discards
      player.hand += deck.replace_cards(discards)
    end
  end

  def handle_moves
    players.each do |player|
      player.ask_move
    end
      # fold, raise, see handler
    end
  end

  def give_pot

    #give winning hand pot
  end

  def won?
    #hanlde winner
  end
end
