class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :slug
      t.string :name
      t.string :background_image
      t.string :rating 
    end
  end
end
