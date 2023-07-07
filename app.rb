require './modules/music_album_module'
require_relative 'book'
require_relative 'music_album'
require_relative 'game'
require_relative 'game_author'
require 'json'
require_relative 'author'
require_relative 'label'

class App
  attr_accessor :books, :music_album, :games, :labels, :file_name

  def initialize
    @books = []
    @music_album = []
    @games = []
    @labels = []
    @genres = []
    @game_author = []
  end

  # add_book

  def add_book
    puts 'Enter published date'
    published_date = gets.chomp
    puts 'Enter title'
    title = gets.chomp
    puts 'Enter author'
    author = gets.chomp
    puts 'Enter cover state'
    cover_state = gets.chomp
    puts 'Enter genre'
    genre = gets.chomp
    @books << Book.new(published_date, title, author, cover_state, genre).to_hash
    @genres << Genre.new(genre).to_hash
    hashed = @books.map(&:to_hash)
    json = JSON.generate(hashed)
    File.write('book.json', json)
    hashed = @genres.map(&:to_hash)
    json = JSON.generate(hashed)
    File.write('add_genre.json', json)
    puts 'book added'
  end

  # add label

  def add_label
    puts 'Enter label name'
    label_name = gets.chomp
    @labels << Label.new(label_name).to_hash
    hashed = @labels.map(&:to_hash)
    json = JSON.generate(hashed)
    File.write('label.json', json)
    puts 'label added'
  end

  # add music album

  def add_music_album
    puts 'Enter published date'
    published_date = gets.chomp
    puts 'Enter name'
    name = gets.chomp
    puts 'Enter genre'
    genre = gets.chomp
    puts 'On spotify?'
    on_spotify = gets.chomp
    on_spotify = true if on_spotify == 'yes'
    on_spotify = false if on_spotify == 'no'
    @music_album << MusicAlbum.new(published_date, name, genre, on_spotify).to_hash
    hashed = @music_album.map(&:to_hash)
    json = JSON.generate(hashed)
    File.write('add_music_album.json', json)

    puts 'music album added'
  end
end

# add game

def add_game
  puts 'Enter published date'
  published_date = gets.chomp
  puts 'Is it a multi player game (yes or no)'
  multiplayer = gets.chomp
  puts 'Enter last played date'
  last_played_at = gets.chomp
  @games << Game.new(multiplayer, last_played_at, published_date).to_hash
  hashed = @games.map(&:to_hash)
  json = JSON.generate(hashed)
  File.write('game.json', json)
  puts 'game added'
end

# add game author
def add_game_author
  puts 'First name'
  first_name = gets.chomp
  puts 'Last name'
  last_name = gets.chomp
  @game_author << GameAuthor.new(first_name, last_name).to_hash
  hashed = @game_author.map(&:to_hash)
  json = JSON.generate(hashed)
  File.write('add_game_author.json', json)
  puts 'game author added'
end

# add genre

def add_genre
  puts 'Enter genre'
  genre = gets.chomp
  @genres << Genre.new(genre).to_hash
  hashed = @genres.map(&:to_hash)
  json = JSON.generate(hashed)
  File.write('add_genre.json', json)
  puts 'genre added'
end

# display books

def display_books
  @books = JSON.parse(File.read('book.json'))
  puts 'No books' if @books.empty?
  @books.each do |book|
    puts "published date: #{book['published_date']}, title: #{book['title']}, author: #{book['author']}, cover state: #{book['cover_state']}"
  end
end

# display game

def display_games
  @games = JSON.parse(File.read('game.json'))
  puts 'No games' if @games.empty?
  @games.each do |game|
    puts "published date: #{game['published_date']}", "multy player: #{game['multiplayer']}"
  end
  puts 'games displayed'
end

# display genre

def display_genres
  @genres = JSON.parse(File.read('add_genre.json'))
  puts 'No genres' if @genres.empty?
  @genres.each do |genre|
    puts "genre: #{genre['name']}"
  end
  puts 'genres displayed'
end

# display music album

def display_music_album
  @music_album = JSON.parse(File.read('add_music_album.json'))
  puts 'No music albums' if @music_album.empty?
  @music_album.each do |music_album|
    puts "published date: #{music_album['published_date']}", "on spotify: #{music_album['on_spotify']}"
  end
end
# display game authors

def display_game_authors
  @game_author = JSON.parse(File.read('add_game_author.json'))
  puts 'No game authors' if @game_author.empty?
  @game_author.each do |game_author|
    puts "first name: #{game_author['first_name']}", "last name: #{game_author['last_name']}"
  end
  puts 'game authors displayed'
end

# display labels

def display_labels
  @labels = JSON.parse(File.read('label.json'))
  puts 'No label' if @labels.empty?
  @labels.each do |label|
    puts "label name: #{label['title']}"
  end
  puts 'label displayed'
end
