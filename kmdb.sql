-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Studios;
DROP TABLE IF EXISTS Actors;
DROP TABLE IF EXISTS Casts;


-- Create new tables, according to your domain model
-- TODO!
CREATE TABLE Movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_title TEXT,
  movie_rating TEXT,
  movie_studio TEXT,
  studio_id INTEGER,
  movie_year INTEGER
);

CREATE TABLE Studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_studio TEXT,
  movie_id INTEGER,
  movie_title TEXT
);

CREATE TABLE Actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor_name TEXT
);

CREATE TABLE Casts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    movie_title TEXT,
    movie_id INTEGER,
    actor_name TEXT,
    actor_id INTEGER,
    character_name TEXT
);


-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!
INSERT INTO Movies (
movie_title,
movie_rating,
movie_studio,
studio_id,
movie_year
)

VALUES (
    "Batman Begins",
    "PG-13",
    "Warner Bros",
    1,
    2005
);


INSERT INTO Movies (
movie_title,
movie_rating,
movie_studio,
studio_id,
movie_year
)

VALUES (
    "The Dark Knight",
    "PG-13",
    "Warner Bros",
    1,
    2008
);


INSERT INTO Movies (
movie_title,
movie_rating,
movie_studio,
studio_id,
movie_year
)

VALUES (
    "The Dark Knight Rises",
    "PG-13",
    "Warner Bros",
    1,
    2012
);


INSERT INTO Studios (
movie_studio,
movie_id,
movie_title
)

VALUES (
    "Warner Bros",
    1,
    "Batman Begins"
);

INSERT INTO Studios (
movie_studio,
movie_id,
movie_title
)

VALUES (
    "Warner Bros",
    2,
    "The Dark Knight"
);


INSERT INTO Studios (
movie_studio,
movie_id,
movie_title
)

VALUES (
    "Warner Bros",
    3,
    "The Dark Knight Rises"
);


INSERT INTO Actors (
actor_name
)

VALUES (
    "Christian Bale"
);

INSERT INTO Actors (
actor_name
)

VALUES (
    "Michael Caine"
);

INSERT INTO Actors (
actor_name
)

VALUES (
    "Liam Neeson"
);

INSERT INTO Actors (
actor_name
)

VALUES (
    "Katie Holmes"
);

INSERT INTO Actors (
actor_name
)

VALUES (
    "Gary Oldman"
);

INSERT INTO Actors (
actor_name
)

VALUES (
    "Heath Ledger"
);

INSERT INTO Actors (
actor_name
)

VALUES (
    "Aaron Eckhart"
);

INSERT INTO Actors (
actor_name
)

VALUES (
    "Maggie Gyllenhaal"
);

INSERT INTO Actors (
actor_name
)

VALUES (
    "Tom Hardy"
);

INSERT INTO Actors (
actor_name
)

VALUES (
    "Joseph Gordon-Levitt"
);

INSERT INTO Actors (
actor_name
)

VALUES (
    "Anne Hathaway"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "Batman Begins",
    1,
    "Christian Bale",
    1,
    "Bruce Wayne"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "Batman Begins",
    1,
    "Michael Caine",
    2,
    "Alfred"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "Batman Begins",
    1,
    "Liam Neeson",
    3,
    "Ra's Al Ghul"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "Batman Begins",
    1,
    "Katie Holmes",
    4,
    "Rachel Dawes"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "Batman Begins",
    1,
    "Gary Oldman",
    5,
    "Commissioner Gordon"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "The Dark Knight",
    2,
    "Christian Bale",
    1,
    "Bruce Wayne"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "The Dark Knight",
    2,
    "Michael Caine",
    2,
    "Alfred"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "The Dark Knight",
    2,
    "Gary Oldman",
    5,
    "Commissioner Gordon"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "The Dark Knight",
    2,
    "Heath Ledger",
    6,
    "Joker"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "The Dark Knight",
    2,
    "Aaron Eckhart",
    7,
    "Harvey Dent"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "The Dark Knight",
    2,
    "Maggie Gyllenhaal",
    8,
    "Rachel Dawes"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "The Dark Knight Rises",
    3,
    "Christian Bale",
    1,
    "Bruce Wayne"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "The Dark Knight Rises",
    3,
    "Michael Caine",
    2,
    "Alfred"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "The Dark Knight Rises",
    3,
    "Gary Oldman",
    5,
    "Commissioner Gordon"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "The Dark Knight Rises",
    3,
    "Tom Hardy",
    9,
    "Bane"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "The Dark Knight Rises",
    3,
    "Joseph Gordon-Levitt",
    10,
    "John Blake"
);

INSERT INTO Casts (
    movie_title,
    movie_id,
    actor_name,
    actor_id,
    character_name
)

VALUES (
    "The Dark Knight Rises",
    3,
    "Anne Hathaway",
    11,
    "Selina Kyle"
);
-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!

SELECT Movies.movie_title, Movies.movie_year, Movies.movie_rating,
Studios.movie_studio FROM Movies INNER JOIN Studios
ON Movies.ID = Studios.movie_id;

.width 21 21 21;
-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
--SELECT movie_title, actor_name, character_name FROM Casts;
SELECT Casts.movie_title, Actors.actor_name, Casts.character_name
FROM Casts INNER JOIN Actors ON Casts.actor_id = Actors.ID; 


-- TODO!