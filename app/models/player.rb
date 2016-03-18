class Player < ActiveRecord::Base
  validates :player_name, presence: true
  validates :player_name, uniqueness: {scope: :user_id}
  validates :position, presence: true
  belongs_to :club
  
  def self.by_position(position)
    where("position = ?", "#{position}").order(:player_name)
  end

  def self.by_letter(letter)
    where("player_name LIKE ?", "#{letter}%").order(:player_name)
  end

  def name
    player_name
  end

  def details
    [player_name, position].join(" - ")
  end
end
