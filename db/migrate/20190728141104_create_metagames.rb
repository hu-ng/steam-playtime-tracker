class CreateMetagames < ActiveRecord::Migration[5.2]
  def change
    create_table :metagames do |t|
      t.string :name
      t.string :appid

      t.timestamps
    end
  end
end
