class AddPlatformToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :platform, :string
    add_column :games, :genres, :string
    add_column :games, :clip, :string
  end
end
