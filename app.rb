require './modules/music_album_module'
require_relative './music_album'
require 'json'

class App
  attr_accessor :books, :music_album, :games, :labels, :file_name

  def initialize
    @books = []
    @music_album = []
    @games = []
    @labels = []
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
    book = Book.new(published_date, title, author, cover_state)
    @books << book
    puts 'book added'
    puts @books
    'books.json'
  end

  # add label

  # def add_label
  #   puts 'Enter label name'
  #   label_name = gets.chomp
  #   label = Label.new(label_name)
  #   @labels << label
  #   puts 'label added'
  #   puts @labels
  # end

  # add music album

  # def add_music_album
  #   puts 'Enter published date'
  #   published_date = gets.chomp
  #   puts 'On spotify?'
  #   on_spotify = gets.chomp
  #   on spotify = true if on_spotify == 'yes'
  #   on spotify = false if on_spotify == 'no'
  #   music_album = MusicAlbum.new(published_date, on_spotify).to_hash
  #   @music_album << music_album
  #   puts 'music album added'
  # end

  # add game

  # def add_game
  #   puts 'Enter published date'
  #   published_date = gets.chomp
  #   puts 'single player?'
  #   single_player = gets.chomp
  #   single_player = true if single_player == 'yes'
  #   single_player = false if single_player == 'no'
  #   puts 'multiplayer?'
  #   multiplayer = gets.chomp
  #   multiplayer = true if multiplayer == 'yes'
  #   multiplayer = false if multiplayer == 'no'
  #   game = Game.new(published_date, single_player, multiplayer).to_hash
  #   @games << game
  #   file_name_write = 'games.json'
  #   puts 'game added'
  # end

  # display books

  def display_books
    @books = JSON.parse(File.read('books.json'))
    puts 'No books' if @books.empty?
    @books.each do |book|
      puts "published date: #{book['published_date']}", "title: #{book['title']}", "author: #{book['author']}", "cover state: #{book['cover_state']}"
    end
    puts 'books displayed'
  end



  # display music album

  def display_music_album
    @music_album = JSON.parse(File.read('music_album.json'))
    puts 'No music albums' if @music_album.empty?
    @music_album.each do |music_album|
      puts "published date: #{music_album['published_date']}", "on spotify: #{music_album['on_spotify']}"
    end
    puts 'music albums displayed'
  end

  # display games

  def display_games
    @games = JSON.parse(File.read('games.json'))
    puts 'No games' if @games.empty?
    @games.each do |game|
      puts "published date: #{game['published_date']}", "single player: #{game['single_player']}", "multiplayer: #{game['multiplayer']}"
    end
    puts 'games displayed'
  end
end

def load_data
  if File.empty?('add_music_album.json')
    puts 'List is empty'
  else
    music_albums = JSON.parse(File.read('add_music_album.json'))
    music_albums.each do |album|
      @music_albums.push(MusicAlbum.new(album['name'], album['on_spotify']))
    end
  end
  if File.empty?('add_genre.json')
    puts 'List is empty'
  else
    genres = JSON.parse(File.read('add_genre.json'))
    genres.each do |genre|
      @genres.push(Genre.new(genre['gnr']))
    end
  end

  def load_data
    music_albums = []
    genres = []
    @music_albums.each do |album|
      music_albums.push({ name: album.name, on_spotify: album.on_spotify })
    end
    @genres.each do |gnr1|
      genres.push({ gnr: gnr1.name })
    end
    File.write('add_music_album.json', JSON.generate(music_albums))
    File.write('add_genre.json', JSON.generate(genres))
  end
end
