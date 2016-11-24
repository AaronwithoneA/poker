require 'deck'

describe Deck do
  subject(:deck) {Deck.new}

  describe '#initialize' do
    it "creates an array of 52 elements" do
      expect(deck.cards.length).to eq(52)
    end

    it "contains only card objects" do
      expect(deck.cards).to all( be_a(Card))
    end

    it "contains 52 cards with unique symbol/value combinations" do
      card_array = deck.cards.map {|card| [card.symbol, card.suit]}
      expect(card_array.uniq).to eq(card_array)
    end
  end

  describe 'shuffle_cards' do

    it "shuffles the cards in the deck" do
      pre_shuffle = deck.cards.dup
      deck.shuffle_cards
      expect(deck.cards).to_not eq(pre_shuffle)
    end
  end

  describe 'deal_one' do
    it "removes one card from the deck" do
      length = deck.cards.length
      deck.deal_one
      expect(deck.cards.length).to eq(length-1)
    end

    it "returns a card" do
      expect(deck.deal_one).to be_a(Card)
    end

  end


end
