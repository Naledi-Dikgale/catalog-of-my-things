CREATE DATABASE catalog;

-- Create item table
CREATE TABLE item (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT,
  author_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (label_id) REFERENCES label(id)
);

-- Create genres table
CREATE TABLE Genres (
  id INT Generated ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100),
);

-- Create music albums table
CREATE TABLE MusicAlbums (
  id INT Generated ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE NOT NULL DEFAULT DATE,
  on_spotify BOOLEAN,
  archived BOOLEAN,
  genre_id INT,
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(id)
);

-- Create author table

CREATE TABLE Author(
    id int generated always as identity,
    first_name varchar(255),
    last_name varchar(255),
    primary key (id)
);

-- Create game table

CREATE TABLE Game(
    id int generated always as identity,
    multiplayer varchar(255),
    last_played_at date,
    published_date date,
    archived boolean,
    author_id int,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id),
    primary key (id)
);

-- schema for labels
CREATE TABLE Label (
  id int generated always as identity,
  title VARCHAR(255),
  color VARCHAR(255)
  publish_date date,
  primary key (id)
);

-- create schema for book
CREATE TABLE Books (
  id Int generated always as identity,
  publisher varchar(255),
  cover_status varchar(255),
  publish_date date,
  archived boolean,
  label_id Int,
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id),
  PRIMARY KEY (id)
);

CREATE INDEX genres ON MusicAlbums (genre_id);
CREATE INDEX label_idx ON Books (label_id);
