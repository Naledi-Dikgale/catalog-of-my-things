CREATE TABLE IF NOT EXISTS books (
  id INTEGER PRIMARY KEY,
  published_date DATE,
  title TEXT,
  author TEXT,
  cover_state TEXT,
  archived INTEGER
);

CREATE TABLE IF NOT EXISTS labels (
  id INTEGER PRIMARY KEY,
  name TEXT
);
