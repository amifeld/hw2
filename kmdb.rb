# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Studio.destroy_all
Movie.destroy_all
Talent.destroy_all
Character.destroy_all

# TODO!

# Generate models and tables, according to the domain model.
new_studio = Studio.new
new_movie = Movie.new
new_talent = Talent.new
new_character = Character.new
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.


new_studio ["studio_name"] = "Warner Bros."
new_studio.save

warner_bros = Studio.find_by ({"studio_name" => "Warner Bros."})

new_movie ["movie_name"] = "Batman Begins"
new_movie ["year_released"] = "2005"
new_movie ["age_rating"] = "PG-13"
new_movie ["studio"] = warner_bros ["id"]
new_movie.save
new_movie = Movie.new
new_movie ["movie_name"] = "The Dark Knight"
new_movie ["year_released"] = "2008"
new_movie ["age_rating"] = "PG-13"
new_movie ["studio"] = warner_bros ["id"]
new_movie.save
new_movie = Movie.new
new_movie ["movie_name"] = "The Dark Knight Rises"
new_movie ["year_released"] = "2012"
new_movie ["age_rating"] = "PG-13"
new_movie ["studio"] = warner_bros ["id"]
new_movie.save


begins = Movie.find_by ({"movie_name" => "Batman Begins"})
knight = Movie.find_by ({"movie_name" => "The Dark Knight"})
rises = Movie.find_by ({"movie_name" => "The Dark Knight Rises"})

new_talent = Talent.new
new_talent ["actor_name"] = "Christian Bale"
new_talent.save
christian = Talent.find_by ({"actor_name" => "Christian Bale"})
new_talent = Talent.new
new_talent ["actor_name"] = "Michael Cain"
new_talent.save
michael = Talent.find_by ({"actor_name" => "Michael Cain"})
new_talent = Talent.new
new_talent ["actor_name"] = "Liam Neeson"
new_talent.save
liam = Talent.find_by ({"actor_name" => "Liam Neeson"})
new_talent = Talent.new
new_talent ["actor_name"] = "Katie Holmes"
new_talent.save
katie = Talent.find_by ({"actor_name" => "Katie Holmes"})
new_talent = Talent.new
new_talent ["actor_name"] = "Gary Oldman"
new_talent.save
gary = Talent.find_by ({"actor_name" => "Gary Oldman"})
new_talent = Talent.new
new_talent ["actor_name"] = "Heath Ledger"
new_talent.save
heath = Talent.find_by ({"actor_name" => "Heath Ledger"})
new_talent = Talent.new
new_talent ["actor_name"] = "Aaron Eckhart"
new_talent.save
aaron = Talent.find_by ({"actor_name" => "Aaron Eckhart"})
new_talent = Talent.new
new_talent ["actor_name"] = "Maggie Gyllenhaal"
new_talent.save
maggie = Talent.find_by ({"actor_name" => "Maggie Gyllenhaal"})
new_talent = Talent.new
new_talent ["actor_name"] = "Tom Hardy"
new_talent.save
tom = Talent.find_by ({"actor_name" => "Tom Hardy"})
new_talent = Talent.new
new_talent ["actor_name"] = "Joseph Gordon-Levitt"
new_talent.save
joseph = Talent.find_by ({"actor_name" => "Joseph Gordon-Levitt"})
new_talent = Talent.new
new_talent ["actor_name"] = "Anne Hathaway"
new_talent.save
anne = Talent.find_by ({"actor_name" => "Anne Hathaway"})


new_character ["character_name"] = "Bruce Wayne"
new_character ["movie_id"] = begins ["id"]
new_character ["talent_id"] = christian ["id"]
new_character.save

new_character = Character.new
new_character ["character_name"] = "Alfred"
new_character ["movie_id"] = begins ["id"]
new_character ["talent_id"] = michael ["id"]
new_character.save
new_character = Character.new
new_character ["character_name"] = "Ra's Al Ghul"
new_character ["movie_id"] = begins ["id"]
new_character ["talent_id"] = liam ["id"]
new_character.save
new_character = Character.new
new_character ["character_name"] = "Rachel Dawes"
new_character ["movie_id"] = begins ["id"]
new_character ["talent_id"] = katie ["id"]
new_character.save
new_character = Character.new
new_character ["character_name"] = "Commissioner Gordon"
new_character ["movie_id"] = begins ["id"]
new_character ["talent_id"] = gary ["id"]
new_character.save
new_character = Character.new
new_character ["character_name"] = "Bruce Wayne"
new_character ["movie_id"] = knight ["id"]
new_character ["talent_id"] = christian ["id"]
new_character.save
new_character = Character.new
new_character ["character_name"] = "Joker"
new_character ["movie_id"] = knight ["id"]
new_character ["talent_id"] = heath ["id"]
new_character.save
new_character = Character.new
new_character ["character_name"] = "Harvey Dent"
new_character ["movie_id"] = knight ["id"]
new_character ["talent_id"] = aaron ["id"]
new_character.save
new_character = Character.new
new_character ["character_name"] = "Alfred"
new_character ["movie_id"] = knight ["id"]
new_character ["talent_id"] = michael ["id"]
new_character.save
new_character = Character.new
new_character ["character_name"] = "Rachel Dawes"
new_character ["movie_id"] = knight ["id"]
new_character ["talent_id"] = maggie ["id"]
new_character.save
new_character = Character.new
new_character ["character_name"] = "Bruce Wayne"
new_character ["movie_id"] = rises ["id"]
new_character ["talent_id"] = christian ["id"]
new_character.save
new_character = Character.new
new_character ["character_name"] = "Commissioner Gordon"
new_character ["movie_id"] = rises ["id"]
new_character ["talent_id"] = gary ["id"]
new_character.save
new_character = Character.new
new_character ["character_name"] = "Bane"
new_character ["movie_id"] = rises ["id"]
new_character ["talent_id"] = tom ["id"]
new_character.save

new_character = Character.new
new_character ["character_name"] = "John Blake"
new_character ["movie_id"] = rises ["id"]
new_character ["talent_id"] = joseph ["id"]
new_character.save

new_character = Character.new
new_character ["character_name"] = "Selina Kyle"
new_character ["movie_id"] = rises ["id"]
new_character ["talent_id"] = anne ["id"]
new_character.save

movie_page = Movie.where ({ "studio" => warner_bros["id"] })

# TODO!

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
for movie in movie_page
    title = movie["movie_name"]
    year = movie["year_released"]
    rating = movie["age_rating"]
    studio = "Warner Bros."
    puts "#{title}  #{year}  #{rating}  #{studio}"
end

# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
