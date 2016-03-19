require 'rails_helper'
require 'faker'

RSpec.describe Team, :type => :model do
  before(:each) do
    @user = User.create!( email: "test_user@test.com", password: "password", password_confirmation: "password")
    @league = League.create!(league_name: "English Premier League", country: "England")
    @club = Club.create(league: @league, club_name: Faker::Company.name )
    @team = Team.create!(team_name: "Winning team", user: @user)
    @goalkeeper  = Player.create!( player_name: "Peter Rufai", position: 'GK', club: @club )
    @defender_1  = Player.create!( player_name: "Efe Ambrose", position: 'DF', club: @club )
    @defender_2  = Player.create!( player_name: "Stephen Keshi", position: 'DF', club: @club )
    @defender_3  = Player.create!( player_name: "Ben Iroha", position: 'DF', club: @club )
    @defender_4  = Player.create!( player_name: "Uche Okechukwu", position: 'DF', club: @club )
    @midfielder_1 = Player.create!( player_name: "Efe Sodje", position: 'MF', club: @club )
    @midfielder_2 = Player.create!( player_name: "Emmanuel Amuneke", position: 'MF', club: @club )
    @midfielder_3 = Player.create!( player_name: "Sunday Oliseh", position: 'MF', club: @club )
    @midfielder_4 = Player.create!( player_name: "John Obi Mikel", position: 'MF', club: @club )
    @midfielder_5 = Player.create!( player_name: "Zidine Zidane", position: 'MF', club: @club )
    @forward      = Player.create!( player_name: "Luis Figo", position: 'FW', club: @club )
    @rooney       = Player.create!( player_name: "Wayne Rooney", position: 'FW', club: @club )
    @fake_player = Player.create!( player_name: "Robitusin", position: 'MF', club: @club )
    @my_players = [@goalkeeper, @defender_1, @defender_2, @defender_3, @defender_4,
                  @midfielder_1, @midfielder_2, @midfielder_3, @midfielder_4, @midfielder_5, @forward]
    @no_goalkeeper = [@rooney, @defender_1, @defender_2, @defender_3, @defender_4,
                  @midfielder_1, @midfielder_2, @midfielder_3, @midfielder_4, @midfielder_5]
    @def_missing = [@goalkeeper, @rooney, @defender_2, @defender_3, @defender_4,
                  @midfielder_1, @midfielder_2, @midfielder_3, @midfielder_4, @midfielder_5, @forward]
    @fwd_missing = [@goalkeeper, @rooney, @defender_2, @defender_3, @defender_4,
                  @midfielder_1, @midfielder_2, @midfielder_3, @midfielder_4, @midfielder_5, @fake_player]
    @dup_players = [@goalkeeper, @defender_1, @defender_1, @defender_3, @defender_4,
                  @midfielder_1, @midfielder_2, @midfielder_3, @midfielder_4, @midfielder_5, @forward]

  end
  it "has valid factory" do
    expect(@team).to be_valid
    # expect( FactoryGirl.create(:team) ).to be_valid
  end

  context "missing attributes" do
    it "is not valid without a team name" do
      expect( FactoryGirl.build(:team, team_name: nil) ).to_not be_valid
    end

    it "is not valid without a goalkeeper" do
      @team.players.push *@no_goalkeeper
      expect(@team.team_valid?(@team)).to be_falsey
    end

    it "is not valid without minimum of four defenders" do
      @team.players.push *@def_missing
      expect(@team.team_valid?(@team)).to be_falsey
      # expect( FactoryGirl.build(:team, defender_1: nil, defender_2: nil, defender_3: nil, defender_4: nil) ).to_not be_valid
    end

    it "is valid with all parameters" do
      @team.players.push *@my_players
      expect(@team.team_valid?(@team)).to be_truthy
      # expect( FactoryGirl.build(:team, defender_1: nil) ).to_not be_valid
    end

    it "is not valid without a forward" do
      @team.players.push *@fwd_missing
      expect(@team.team_valid?(@team)).to be_falsey
      # expect( FactoryGirl.build(:team, forward: nil) ).to_not be_valid
    end

  end

  context "players are duplicated in team" do
    it "is not valid with a duplicate team member" do
      @team.players.push *@dup_players
      expect(@team.team_valid?(@team)).to be_falsey
    end
  end



  # pending "add some examples to (or delete) #{__FILE__}"
end
