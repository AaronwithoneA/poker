require 'hand'

describe 'Hand' do
  subject(:hand) {Hand.new}

  describe 'initialize' do

    it 'initializes with an empty array' do
      expect(hand.cards.length).to eq(0)
    end

    it "contains only card objects" do
      expect(hand.cards).to all( be_a(Card))
    end

  end

  describe '#evaluate' do
    let (:three_of_clubs) {double("card",:value =>3, :symbol => :three, :suit => :clubs)}
    let (:three_of_hearts) {double("card",:value =>3, :symbol => :three, :suit => :hearts)}
    let (:three_of_diamonds) {double("card",:value =>3, :symbol => :three, :suit => :diamonds)}
    let (:three_of_spades) {double("card",:value =>3, :symbol => :three, :suit => :spades)}
    let (:nine_of_clubs) {double("card",:value =>9, :symbol => :nine, :suit => :clubs)}
    let (:ten_of_hearts) {double("card",:value =>10, :symbol => :ten, :suit => :hearts)}
    let (:ten_of_clubs) {double("card",:value =>10, :symbol => :ten, :suit => :clubs)}
    let (:jack_of_clubs) {double("card",:value =>11, :symbol => :jack, :suit => :clubs)}
    let (:queen_of_clubs) {double("card",:value =>12, :symbol => :queen, :suit => :clubs)}
    let (:king_of_clubs) {double("card",:value =>13, :symbol => :king, :suit => :clubs)}
    let (:ace_of_clubs) {double("card",:value =>14, :symbol => :ace, :suit => :clubs)}
    let (:seven_of_clubs) {double("card",:value =>7, :symbol => :seven, :suit => :clubs)}


    it "returns a royal flush" do
      hand.cards = [ten_of_clubs, jack_of_clubs, queen_of_clubs, king_of_clubs, ace_of_clubs]
      expect(hand.evaluate).to eq(:royal_flush)
    end

    it "returns a straight flush" do
      hand.cards = [ten_of_clubs, jack_of_clubs, queen_of_clubs, king_of_clubs, nine_of_clubs]
      expect(hand.evaluate).to eq(:straight_flush)
    end

    it "returns a four of a kind" do
      hand.cards = [three_of_clubs, three_of_spades, three_of_hearts, three_of_diamonds, nine_of_clubs]
      expect(hand.evaluate).to eq(:four_of_a_kind)
    end

    it "returns a full house" do
      hand.cards = [three_of_clubs, three_of_spades, three_of_hearts, ten_of_clubs, ten_of_hearts]
      expect(hand.evaluate).to eq(:full_house)
    end

    it "returns a flush" do
      hand.cards = [ten_of_clubs, three_of_clubs, queen_of_clubs, king_of_clubs, nine_of_clubs]
      expect(hand.evaluate).to eq(:flush)
    end

    it "returns a straight" do
      hand.cards = [ten_of_hearts, jack_of_clubs, queen_of_clubs, king_of_clubs, nine_of_clubs]
      expect(hand.evaluate).to eq(:straight)
    end

    it "returns a three of a kind" do
      hand.cards = [three_of_clubs, three_of_spades, three_of_hearts, jack_of_clubs, nine_of_clubs]
      expect(hand.evaluate).to eq(:three_of_a_kind)
    end

    it "returns two pair" do
      hand.cards = [three_of_clubs, three_of_spades, ten_of_hearts, ten_of_clubs, nine_of_clubs]
      expect(hand.evaluate).to eq(:two_pair)
    end

    it "returns a pair" do
      hand.cards = [three_of_clubs, three_of_spades, jack_of_clubs, ten_of_clubs, nine_of_clubs]
      expect(hand.evaluate).to eq(:pair)
    end

    it "returns the highest card if no other hand is detected" do
      hand.cards = [three_of_clubs, seven_of_clubs, jack_of_clubs, ten_of_hearts, nine_of_clubs]
      expect(hand.evaluate).to eq(:jack)
    end



  end


end
