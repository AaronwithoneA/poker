require 'card'

describe 'Card' do
  subject(:card) {Card.new(:jack, :spades)}
  describe 'initialize' do
    it "initializes with a suit" do
      expect(card.suit).to eq(:spades)
    end

    it "initializes with a value" do
      expect(card.value).to eq(11)
    end

    it "initializes with a symbol" do
      expect(card.symbol).to eq(:jack)
    end
  end
end
