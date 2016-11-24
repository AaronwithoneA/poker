class Player
  attr_reader :name, :hand, :chips

  def initialize(name)
    @name = name
    @hand = Hand.new
    @chips = 10
  end

  def get_bet
    puts "You have #{@chips} chips. How much would you like to throw away?"
    gets.chomp.to_i
  end

  def get_bet_reaction(current_bet)
    puts "The current bet is #{current_bet}. Type S for see, F for fold, R for raise."
    input = gets.chomp.downcase
    if input == "s"
      :see
    elsif input == "f"
      :fold
    elsif input == "r"
      :raise
    else
      raise "Invalid entry"
    end
  end

  def get_discard
    
  end

end
