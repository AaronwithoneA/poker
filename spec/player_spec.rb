require 'player'

describe 'Player' do
  describe 'initialize' do
    subject(:player) {Player.new('Ken')}

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

    it 'return array has a length of less than 3' do
      expect(player.get_discard.length).to be <(3)
    end

  end




end
