class CreateTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :trackers do |t|
      t.float :threshold
      t.integer :days
      t.integer :weeks
      t.integer :months
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
