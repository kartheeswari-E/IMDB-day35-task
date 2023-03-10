-- Check DATABASE is already exists if exists delete the DATABASE
DROP DATABASE IF EXISTS TASK;

-- Create TASK database
CREATE DATABASE TASK;

-- Use TASK database
USE TASK;

-- Character set
-- want to be able to distinguish text with accents
ALTER DATABASE TASK CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

-- Create tables only
CREATE TABLE movie_list(
    id          INT NOT NULL AUTO_INCREMENT,
    movie_name  VARCHAR(225) NOT NULL,
    director    VARCHAR(225) NOT NULL,
    artist      VARCHAR(225) NOT NULL,
    realse_year INT,
    PRIMARY KEY (id, artist) 
);

CREATE TABLE movie_details(
    movie_id    INT NOT NULL,
    movie_name  VARCHAR(225),
    poster      LONGBLOB,
    trailer     LONGBLOB,
    FOREIGN KEY (movie_id) REFERENCES movie_list(id)
);

CREATE TABLE movie_genres (
  movie_id      INT NOT NULL,
  genre         VARCHAR(255) NOT NULL,
  music         VARCHAR(225),
  story         VARCHAR(225),
  screenplay    VARCHAR(225),
  producing     VARCHAR(225),
  FOREIGN KEY (movie_id) REFERENCES movie_list(id)
);

CREATE TABLE movie_ratings (
  movie_id          INT NOT NULL,
  average_rating    FLOAT,
  num_votes		    INT,
  FOREIGN KEY (movie_id) REFERENCES movie_list(id)
);

CREATE TABLE rating_details(
    movie_id        INT NOT NULL,
    reviewer_name   VARCHAR(225),
    rating_value    INT NOT NULL,
    review_of_movie TEXT,
    FOREIGN KEY (movie_id) REFERENCES movie_list(id)
);

CREATE TABLE artist(
    artist_name     VARCHAR(225) NOT NULL,
    gender          VARCHAR(225),
    birth_date      VARCHAR(225),
    no_of_movies    INT,
    dance           BOOLEAN,
    dubbing         BOOLEAN,
    singing         BOOLEAN,
    music           BOOLEAN,
    other_skills    VARCHAR(225)
);

CREATE TABLE artist_role(
    movie_id        INT NOT NULL,
    artist_name     VARCHAR(225),
    no_of_role      INT,
    role_of_movie   VARCHAR(225),
    character_name  VARCHAR(225),
    dance           BOOLEAN,
    dubbing         BOOLEAN,
    singing         BOOLEAN,
    FOREIGN KEY (movie_id, artist_name) REFERENCES movie_list(id, artist)
);

-- Insert values of movie_details of image and video files.
INSERT INTO movie_details values (
    1,
    "Vikram", 
    load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/123.jpg'),
    load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/123.mp4')
);