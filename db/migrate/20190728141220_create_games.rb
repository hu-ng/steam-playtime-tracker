class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.float :playtime
      t.references :user, foreign_key: true
      t.references :metagame, foreign_key: true

      t.timestamps
    end
  end
end
