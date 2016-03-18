class Team < ActiveRecord::Base
  validates :team_name, presence: true
  validates :goalkeeper, presence: true
  validates :defender_1, presence: true
  validates :defender_2, presence: true
  validates :defender_3, presence: true
  validates :defender_4, presence: true
  validates :midfielder_1, presence: true
  validates :midfielder_2, presence: true
  validates :midfielder_3, presence: true
  validates :midfielder_4, presence: true
  validates :midfielder_5, presence: true
  validates :forward, presence: true

  belongs_to :user

  def name
    @team_name
  end

  private

    def team_valid?
      # unless
    end
end
