class League < ActiveRecord::Base
  validates :league_name, presence: true
  validates :country, presence: true
end
