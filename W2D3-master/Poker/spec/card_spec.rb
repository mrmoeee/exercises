require 'card'

RSpec.describe Card do
  subject(:card) { Card.new(10, :S) }
  describe '#initialize' do
    it 'creates a number and a suit' do
      expect(card.number).to eq(10)
      expect(card.suit).to eq(:S)
    end
  end
end
