require 'faker'

FactoryGirl.define do
  factory :team do
    user nil
    team_name     "Winning Team"
    goalkeeper    {Faker::Name.name }
    defender_1    {Faker::Name.name }
    defender_2    {Faker::Name.name }
    defender_3    {Faker::Name.name }
    defender_4    {Faker::Name.name }
    midfielder_1  {Faker::Name.name }
    midfielder_2  {Faker::Name.name }
    midfielder_3  {Faker::Name.name }
    midfielder_4  {Faker::Name.name }
    midfielder_5  {Faker::Name.name }
    forward       {Faker::Name.name }
  end
end
