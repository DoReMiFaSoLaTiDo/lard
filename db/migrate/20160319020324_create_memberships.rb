class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :team, index: true
      t.references :player, index: true

      t.timestamps null: false
    end
    add_foreign_key :memberships, :teams
    add_foreign_key :memberships, :players
  end
end
