class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string "movie_name"
      t.string "year_released"
      t.string "age_rating"
      t.integer "studio"
      t.timestamps
    end
  end
end
