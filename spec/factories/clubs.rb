require 'faker'

FactoryGirl.define do
  factory :club do
    league nil
    club_name { Faker::Company.name}
  end
end
