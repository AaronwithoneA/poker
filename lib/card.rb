

class Card
  attr_reader :symbol, :suit, :value
  VALUE_KEY = {
                two: 2,
                three: 3,
                four: 4,
                five: 5,
                six: 6,
                seven: 7,
                eight: 8,
                nine: 9,
                ten: 10,
                jack: 11,
                queen: 12,
                king: 13,
                ace: 14,
  }


  def initialize(symbol, suit)
    @symbol = symbol
    @suit = suit
    @value = VALUE_KEY[symbol]
  end

  def ==(other_card)
    self.symbol == other_card.symbol && self.suit == other_card.suit
  end

end
