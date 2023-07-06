CREATE TABLE music_albums (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  artist VARCHAR(255) NOT NULL,
  release_year INT NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  genre_id INT REFERENCES genres(id)
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
) ;

CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  genre_id INT,
  label_id INT,
  publish_date DATE,
  author_id INT,
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(label_id),
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id),
  PRIMARY KEY(id)
);

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100)
);
