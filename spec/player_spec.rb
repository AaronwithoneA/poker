require 'player'

describe 'Player' do
  subject(:player) {Player.new('Ken')}
  describe 'initialize' do


    it 'initializes with name' do
      expect(player.name).to eq('Ken')
    end

    it 'initializes with chip stash with 10 chips' do
      expect(player.chips).to eq(10)
    end

    it 'initializes with empty hand' do
      expect(player.hand).to be_a(Hand)
    end
  end

  describe 'get_discard' do


    it 'returns an array' do
      expect(player.get_discard).to be_a(Array)
    end

    it 'return array has a length of less than 4' do
      expect(player.get_discard.length).to be <(4)
    end

    it 'returns an array of indices' do
      expect(player.get_discard).to all( be <(5))
    end

    it 'raises an error if the user enters nonsense'

  end


  describe '#get_bet_reaction' do
    it "returns :fold, :see, or :raise" do
      expect([:fold, :see, :raise]).to include(player.get_bet_reaction(2))
    end
  end

  describe '#get_bet' do
    it "returns an integer less than the player's chips" do
      expect(player.get_bet).to be <(player.chips)
    end
  end


end
