class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.references :league, index: true

      t.timestamps null: false
    end
    add_foreign_key :clubs, :leagues
  end
end
