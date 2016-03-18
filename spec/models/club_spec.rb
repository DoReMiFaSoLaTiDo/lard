require 'rails_helper'

RSpec.describe Club, :type => :model do
  it "has valid factory" do
    FactoryGirl.create(:club).should be_valid
  end
  it "is not valid without a name" do
    FactoryGirl.build(:club, club_name: nil).should_not be_valid
    # club = Club.new(name: nil)
    # expect{ club.save! }.to raise_error
  end
  it "returns club's name as a string" do
    my_club = FactoryGirl.create(:club, club_name: "Leicester City")
    my_club.name.should == "Leicester City"
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
