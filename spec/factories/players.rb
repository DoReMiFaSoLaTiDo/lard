require 'faker'

FactoryGirl.define do
  factory :player do
    position 'GK'
    player_name {Faker::Name.name }
    club 1
  end
end
