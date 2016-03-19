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

  private

    def team_valid?
      # unless
    end
end
