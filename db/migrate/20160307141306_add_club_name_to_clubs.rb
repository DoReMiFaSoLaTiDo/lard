class AddClubNameToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :club_name, :string
    add_column :clubs, :nick_name, :string
  end
end
