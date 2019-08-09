class AddPlaytimeToTrackers < ActiveRecord::Migration[5.2]
  def change
    add_column :trackers, :playtime, :float, default: 0.0
  end
end
