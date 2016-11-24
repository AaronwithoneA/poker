class Player
  attr_reader :name, :hand, :chips

  def initialize(name)
    @name = name
    @hand = Hand.new
    @chips = 10
  end

end
