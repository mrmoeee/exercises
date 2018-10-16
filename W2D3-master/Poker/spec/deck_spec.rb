require 'rspec'
require 'deck'

RSpec.describe Deck do
  subject(:deck) {Deck.build_deck}

  describe "#build_deck" do
    it "builds the correct amount of cards" do
        expect(deck.cards.length).to eq(52)
    end
    it "builds the right amount of suits" do
      count_s, count_h, count_c, count_d = 0,0,0,0
      deck.cards.each do |card|
        count_s += 1 if card.suit == :S
        count_h += 1 if card.suit == :H
        count_c += 1 if card.suit == :C
        count_d += 1 if card.suit == :D
      end
      expect(count_s).to eq(13)
      expect(count_h).to eq(13)
      expect(count_c).to eq(13)
      expect(count_d).to eq(13)
    end
  end
  describe "#shuffle" do 
    it "shuffles the cards" do
      pre_shuffle = deck.cards.dup
      deck.shuffle
      expect(deck.cards).not_to eq(pre_shuffle)
    end
  end
  
  describe "#deal" do 
    it "deals the amount of cards asked for" do
      expect(deck.deal(5).length).to eq(5)
    end
    it "removes the cards from the deck" do 
      deck.deal(5) 
      expect(deck.cards.length).to eq(47)
    end
  end
  
  describe "#replace_cards" do 
    it "adds given card back to the deck" do
      cards = deck.deal(3)
      replace = deck.replace_cards(cards)
      expect(deck.cards.length).to eq(49)
    end
  end
end