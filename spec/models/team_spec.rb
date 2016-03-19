require 'rails_helper'
require 'faker'

RSpec.describe Team, :type => :model do
  before(:each) do
    @user = User.create!( email: "test_user@test.com", password: "password", password_confirmation: "password")
    @league = League.create!(league_name: "English Premier League", country: "England")
    @club = Club.create(league: @league, club_name: Faker::Company.name )
    @team = Team.create!(team_name: "Winning team", user: @user)
    @goalkeeper  = Player.new( player_name: "Peter Rufai", position: 'GK', club: @club )
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
    my_players = [@goalkeeper, @defender_1, @defender_2, @defender_3, @defender_4,
                  @midfielder_1, @midfielder_2, @midfielder_3, @midfielder_4, @midfielder_5]
    @team.players.push *my_players
  end
  it "has valid factory" do
    expect(@team).to be_valid
    # expect( FactoryGirl.create(:team) ).to be_valid
  end

  context "missing names" do
    # it "is not valid without a team name" do
    #   expect( FactoryGirl.build(:team, team_name: nil) ).to_not be_valid
    # end

    # it "is not valid without a goalkeeper" do
    #   expect( FactoryGirl.build(:team, goalkeeper: nil) ).to_not be_valid
    # end
    #
    # it "is not valid without minimum of four defenders" do
    #   expect( FactoryGirl.build(:team, defender_1: nil, defender_2: nil, defender_3: nil, defender_4: nil) ).to_not be_valid
    # end
    #
    # it "is not valid without a defender" do
    #   expect( FactoryGirl.build(:team, defender_1: nil) ).to_not be_valid
    # end
    #
    # it "is not valid without a forward" do
    #   expect( FactoryGirl.build(:team, forward: nil) ).to_not be_valid
    # end

  end

  # context "names are duplicated in team" do
  #   it "is not valid with a duplicate team member" do
  #     me = FactoryGirl.create(:user)
  #     # FactoryGirl.create(:team, user: me, defender_1: "Bode Awesu")
  #     expect( FactoryGirl.build(:team, user: me, defender_1: "Bode Awesu", defender_2: "Bode Awesu") ).to_not be_valid
  #   end
  # end



  # pending "add some examples to (or delete) #{__FILE__}"
end
