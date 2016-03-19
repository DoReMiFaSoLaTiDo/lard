class Team < ActiveRecord::Base
  validates :team_name, presence: true
  validates_uniqueness_of :team_name
  # validates :goalkeeper, presence: true
  # validates_uniqueness_of :goalkeeper, scope: [:user_id]
  # validates :defender_1, presence: true
  # validates_uniqueness_of :defender_1, scope: [:user_id]
  # validates :defender_2, presence: true
  # validates_uniqueness_of :defender_2, scope: [:user_id]
  # validates :defender_3, presence: true
  # validates_uniqueness_of :defender_3, scope: [:user_id]
  # validates :defender_4, presence: true
  # validates_uniqueness_of :defender_4, scope: [:user_id]
  # validates :midfielder_1, presence: true
  # validates_uniqueness_of :midfielder_1, scope: [:user_id]
  # validates :midfielder_2, presence: true
  # validates_uniqueness_of :midfielder_2, scope: [:user_id]
  # validates :midfielder_3, presence: true
  # validates_uniqueness_of :midfielder_3, scope: [:user_id]
  # validates :midfielder_4, presence: true
  # validates_uniqueness_of :midfielder_4, scope: [:user_id]
  # validates :midfielder_5, presence: true
  # validates_uniqueness_of :midfielder_5, scope: [:user_id]
  # validates :forward, presence: true
  # validates_uniqueness_of [:defender_1, :defender_2, :defender_3, :defender_4, :midfielder_1, :midfielder_2, :midfielder_3, :midfielder_4, :midfielder_5, :forward], scope: [:user_id]

  belongs_to :user

  has_many :memberships
  has_many :players, -> { uniq }, through: :memberships

  def name
    @team_name
  end

  def team_valid?(team)
    num_ok, has_gk, has_def, has_fwd = false, false, false, false
    players_collection = []
    goalkeeper_collection = []
    defender_collection = []
    forward_collection = []

    team.players.each do |player|
      players_collection << player unless players_collection.include?(player)
      goalkeeper_collection << player if player.position == 'GK'
      defender_collection << player if player.position == 'DF'
      forward_collection << player if player.position == 'FW'
    end

    num_players_ok = true if players_collection.size.eql?(11)
    has_gk = true if goalkeeper_collection.size.eql?(1)
    has_def = true if defender_collection.size >= 4
    has_fwd = true if forward_collection.size >= 1

    return num_players_ok && has_gk && has_def && has_fwd
  end

  private

    def has_goalkeeper?(team)
      has_gk = false
      team.players.each do |player|
        has_gk = true if player.position == 'GK'
      end
      return has_gk
    end

    def has_defenders?(team)
      has_def = false
      count = 0

      team.players.each do |player|
        count += 1 if player.position == 'DF'
      end

      has_def = true if count >= 4
      return has_def
    end

    def has_forward?(team)
      has_fwd = false

      team.players.each do |player|
        has_fwd = true if player.position == 'FW'
      end
      return has_fwd

    end
end
