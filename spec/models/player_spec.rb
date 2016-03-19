require 'rails_helper'

RSpec.describe Player, :type => :model do
  before(:each) do
    @league = League.create!(league_name: "English Premier League", country: "England")
    @club = Club.create!(league: @league, club_name: Faker::Company.name )
  end
  it "has valid factory" do
    expect( FactoryGirl.create(:player, club: @club) ).to be_valid
  end

  it "is not valid without a name" do
    expect( FactoryGirl.build(:player, club: @club, player_name: nil) ).to_not be_valid

  end
  it "is not valid without a position" do
    player = Player.new(club: @club, position: nil)
    expect{ player.save! }.to raise_error
  end

  it "returns player's name and position as a string" do
    player = FactoryGirl.create(:player, player_name: "Zinedine Zidane", position: "MF",  club: @club)
    expect( player.details).to eq "Zinedine Zidane - MF"
  end

  describe "filter name by letter" do
    before :each do

      @rooney = FactoryGirl.create(:player, player_name: "Rooney", position: "FW", club: @club)
      @sterling = FactoryGirl.create(:player, player_name: "Sterling", position: "MF", club: @club)
      @vander = FactoryGirl.create(:player, player_name: "Van Der Sar", position: "GK", club: @club)
      @romelu = FactoryGirl.create(:player, player_name: "Romelu Lukaku", position: "FW", club: @club)

    end
    context "matching letters" do
      it "returns sorted array of results that match name" do

        expect( Player.by_letter("R") ).to eq ([@romelu, @rooney ])
      end

      it "returns sorted array of results that match position" do

        expect( Player.by_position("FW") ).to eq ([@romelu, @rooney])
      end
    end

    context "non-matching letters or position" do
      it "excludes players that don't match from resultset position" do

        expect( Player.by_position("FW") ).to_not include @vander
      end

      it "excludes players that don't match from sorted array of results that match name" do

        expect( Player.by_letter("R") ).to_not include @sterling
      end
    end
  end





  #pending "add some examples to (or delete) #{__FILE__}"
end
