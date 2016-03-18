require 'rails_helper'

RSpec.describe Team, :type => :model do
  it "has valid factory" do
    expect( FactoryGirl.create(:team) ).to be_valid
  end

  context "missing names" do
    it "is not valid without a team name" do
      expect( FactoryGirl.build(:team, team_name: nil) ).to_not be_valid
    end

    it "is not valid without a goalkeeper" do
      expect( FactoryGirl.build(:team, goalkeeper: nil) ).to_not be_valid
    end

    it "is not valid without minimum of four defenders" do
      expect( FactoryGirl.build(:team, defender_1: nil, defender_2: nil, defender_3: nil, defender_4: nil) ).to_not be_valid
    end

    it "is not valid without a defender" do
      expect( FactoryGirl.build(:team, defender_1: nil) ).to_not be_valid
    end

    it "is not valid without a forward" do
      expect( FactoryGirl.build(:team, forward: nil) ).to_not be_valid
    end

  end

  context "names are duplicated in team" do
    it "is not valid with a duplicate team member" do
      me = FactoryGirl.create(:user)
      # FactoryGirl.create(:team, user: me, defender_1: "Bode Awesu")
      expect( FactoryGirl.build(:team, user: me, defender_1: "Bode Awesu", defender_2: "Bode Awesu") ).to_not be_valid
    end
  end



  # pending "add some examples to (or delete) #{__FILE__}"
end
