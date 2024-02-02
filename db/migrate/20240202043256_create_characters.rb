class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string "character_name"
      t.integer "movie_id"
      t.integer "talent_id"
      t.timestamps
    end
  end
end
