
require './modules/music_album_module'
# require './modules/game_module'
require_relative 'book'
require_relative 'music_album'
require_relative 'game'
require_relative 'game_author'
# require_relative 'genre'
require 'json'
require_relative './game'
require_relative './author'

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
    @books << Book.new(published_date, title, author, cover_state, genre)
    hashed = @books.map(&:to_hash)
    json = JSON.generate(hashed)
    File.write('book.json', json)
    # update_book = []
    # @books.each do |book|
    #   update_book << { 'name' => book.title, 'publish_date' => book.published_date, 'cover_state' => book.cover_state, 'author' => book.author, 'genre' => book.genre }
    # end

    # File.write('book.json', JSON.generate(update_book))
    puts 'book added'
  end
 
  # add label

   def add_label
     puts 'Enter label name'
    label_name = gets.chomp
   label = Label.new(label_name)
    @labels << label
    puts 'label added'
    puts @labels
  end

  # add music album

  # add label

  def add_label
    puts 'Enter label name'
    label_name = gets.chomp
    label = Label.new(label_name)
    @labels << label
    puts 'label added'
    puts @labels
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
    puts 'single player?'
    single_player = gets.chomp
    single_player = true if single_player == 'yes'
    single_player = false if single_player == 'no'
    puts 'Enter last played date'
    last_played_at = gets.chomp
    @games << Game.new(single_player, last_played_at, published_date).to_hash
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
    puts 'books displayed'
    @books.each do |book|
      print "published date: #{book.published_date} , title: #{book.title} , author: #{book.author} , cover state: #{book.cover_state}"
    end
  end

  # display music album

  def display_music_album
    @music_album = JSON.parse(File.read('add_music_album.json'))
    puts 'No music albums' if @music_album.empty?
    @music_album.each do |music_album|
      puts "published date: #{music_album['published_date']}", "on spotify: #{music_album['on_spotify']}"
  # display games

#   def display_games
#     @games = JSON.parse(File.read('games.json'))
#     puts 'No games' if @games.empty?
#     @games.each do |game|
#       puts "published date: #{game['published_date']}", "single player: #{game['single_player']}", "multiplayer: #{game['multiplayer']}"
#     end
#     puts 'games displayed'
#   end
# end
  def display_music_albums
    if @music_albums.empty?
      puts 'No music albums found.'
    else
      puts 'List of music albums:'
      @music_albums.each do |album|
        puts "Name: #{album.name}"
        puts "On Spotify: #{album.on_spotify ? 'Yes' : 'No'}"
        puts '-' * 30
      end
    end
    puts 'music albums displayed'
  end
end

  # display games

  def display_games
    @games = JSON.parse(File.read('game.json'))
    puts 'No games' if @games.empty?
    @games.each do |game|
      puts "published date: #{game['published_date']}", "single player: #{game['single_player']}"
    end
    puts 'games displayed'
  end

  # display genres

  def display_genres
    @genres = JSON.parse(File.read('add_genre.json'))
    puts 'No genres' if @genres.empty?
    @genres.each do |genre|
      puts "genre: #{genre['genre_name']}"
    end
    puts 'genres displayed'
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

  def get_data(file_name)
    if File.exist?("#{file_name}.json")
      File.read("#{file_name}.json")
    else
      empty_json = [].to_json
      File.write("#{file_name}.json", empty_json)
      empty_json
    end
  end
  
  # def load_data
    # musics = JSON.parse(get_data('music'))
    # genres = JSON.parse(get_data('genres'))
    # books = JSON.parse(get_data('books'))
    # labels = JSON.parse(get_data('labels'))
    # games = JSON.parse(get_data('games'))
    # authors = JSON.parse(get_data('authors'))
  
    # musics.each do |music|
    #   @musics << MusicAlbum.new(music['name'], music['publish_date'], music['on_spotify'])
    # end
  
    # genres.each do |genre|
    #   @genres << Genre.new(genre['name'])
    # end
  
    # books.each do |book|
    #   @books << Book.new(book['publisher'], book['cover_state'])
    # end
  
    # labels.each do |label|
    #   @labels << Label.new(label['title'], label['color'], label['items'])
    # end
  
    # games.each do |game|
    #   @games << Game.new(game['publish_date'], game['archived'], game['multiplayer'], game['last_played_at'],
    #                      game['author'])
    # end
  
    # authors.each do |author|
    #   @authors << Author.new(author['id'], author['name'])
    # end
  # end

end

# def load_data
#   if File.empty?('add_music_album.json')
#     puts 'List is empty'
#   else
#     music_albums = JSON.parse(File.read('add_music_album.json'))
#     music_albums.each do |album|
#       @music_albums.push(MusicAlbum.new(album['name'], album['on_spotify']))
#     end
#   end
#   if File.empty?('add_genre.json')
#     puts 'List is empty'
#   else
#     genres = JSON.parse(File.read('add_genre.json'))
#     genres.each do |genre|
#       @genres.push(Genre.new(genre['gnr']))
#     end
#   end

#     if File.empty?('book.json')
#       puts 'List is empty'
#     else
#       books = JSON.parse(File.read('book.json'))
#       books.each do |book|
#         @books.push(Book.new(book['published_date'], book['title'], book['author'], book['cover_state'], book['genre']))
#       end
#     end

#   def load_data
#     music_albums = []
#     genres = []
#     books = []
#     @music_albums.each do |album|
#       music_albums.push({ name: album.name, on_spotify: album.on_spotify })
#     end
#     @genres.each do |gnr1|
#       genres.push({ gnr: gnr1.name })
#     end
#     @books.each do |book|
#       books.push({ published_date: book.published_date, title: book.title, author: book.author, cover_state: book.cover_state, genre: book.genre })
#     end
#     File.write('add_music_album.json', JSON.generate(music_albums))
#     File.write('add_genre.json', JSON.generate(genres))
#     File.write('book.json', JSON.generate(books))
#   end
# end

