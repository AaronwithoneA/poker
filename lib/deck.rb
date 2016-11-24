class Deck
  attr_reader :cards

  def initialize
    @cards = []
    populate_deck

  end

  def populate_deck
    symbols = [:two,
   :three,
   :four,
   :five,
   :six,
   :seven,
   :eight,
   :nine,
   :ten,
   :jack,
   :queen,
   :king,
   :ace]
    suits = [:hearts, :spades, :diamonds, :clubs]
    suits.each do |suit|
      symbols.each do |symbol|
        @cards << Card.new(symbol,suit)
      end
    end
  end

  def shuffle_cards
    @cards.shuffle!
  end

  def deal_one
    @cards.pop
  end


end

#
# last_card = deck.last
# dealt_card = deck.pop
