class AddGoalkeeperToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :goalkeeper, :string
    add_column :teams, :defender_1, :string
    add_column :teams, :defender_2, :string
    add_column :teams, :defender_3, :string
    add_column :teams, :defender_4, :string
    add_column :teams, :midfielder_1, :string
    add_column :teams, :midfielder_2, :string
    add_column :teams, :midfielder_3, :string
    add_column :teams, :midfielder_4, :string
    add_column :teams, :midfielder_5, :string
    add_column :teams, :forward, :string
  end
end
