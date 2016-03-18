class Club < ActiveRecord::Base
  validates :club_name, presence: true

  belongs_to :league
  has_many :players

  def name
    club_name
  end
end
