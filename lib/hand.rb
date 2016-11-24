class Hand
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def evaluate
    if flush? && straight? && @cards.any? {|card| card.symbol == :ace }
      :royal_flush
    elsif flush? && straight?
      :straight_flush
    elsif of_a_kind.values.include?(4)
      :four_of_a_kind
    elsif of_a_kind.values.sort == [2,3]
      :full_house
    elsif flush?
      :flush
    elsif straight?
      :straight
    elsif of_a_kind.values.include?(3)
      :three_of_a_kind
    elsif of_a_kind.values.sort == [1,2,2]
      :two_pair
    elsif of_a_kind.values.include?(2)
      :pair
    else
      max_val = @cards.map{|card| card.value}.sort.last
      @cards.find {|card| card.value == max_val }.symbol
    end
  end

  def flush?
    @cards.map{|card| card.suit}.uniq.length == 1
  end

  def straight?
    vals = @cards.map{|card| card.value}.sort
    vals[0..-2].each_index do |idx|
      unless vals[idx] == vals[idx + 1] - 1
        return false
      end
    end
    true
  end


  def of_a_kind
    result = {}
    @cards.each do |card|
      this_symbol = card.symbol
      unless result.keys.include?(this_symbol)
        result[this_symbol] = @cards.count {|c| c.symbol == this_symbol}
      end
    end
    result
  end

end
