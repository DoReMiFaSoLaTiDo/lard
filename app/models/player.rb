class Player < ActiveRecord::Base
  # attr_accessor :player_name, :position
  validates :player_name, presence: true
  validates_uniqueness_of :player_name
  validates :position, presence: true

  belongs_to :club

  has_many :memberships
  has_many :teams, through: :memberships
  # has_many :users, through: :teans
  # belongs_to :playable, polymorphic: true

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
