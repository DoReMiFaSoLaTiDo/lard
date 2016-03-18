class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :player_name
      t.references :club, index: true

      t.timestamps null: false
    end
    add_foreign_key :players, :clubs
  end
end
