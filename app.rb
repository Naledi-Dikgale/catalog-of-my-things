require_relative 'item'
require_relative 'book'
require_relative 'music_album'
require_relative 'game'
require_relative 'genre'

require 'json'

class App
  attr_accessor :books, :music_albums, :genres, :games

  def initialize
    @books = []
    @music_albums = []
    @genres = []
    @games = []
    load_data
  end

  def load_data
    if File.exist?('add_book.json')
      books_data = JSON.parse(File.read('add_book.json'))
      books_data.each do |book|
        @books.push(Book.new(book['title'], book['author'], book['genre']))
      end
    end

    if File.exist?('add_music_album.json')
      music_albums_data = JSON.parse(File.read('add_music_album.json'))
      music_albums_data.each do |album|
        @music_albums.push(MusicAlbum.new(album['name'], album['on_spotify']))
      end
    end

    if File.exist?('add_genre.json')
      genres_data = JSON.parse(File.read('add_genre.json'))
      genres_data.each do |genre|
        @genres.push(Genre.new(genre['name']))
      end
    end

    if File.exist?('add_game_author.json')
      game_authors_data = JSON.parse(File.read('add_game_author.json'))
      game_authors_data.each do |author|
        @games.push(GameAuthor.new(author['name'], author['game']))
      end
    end
  end

  def add_book
    puts 'Enter book title:'
    title = gets.chomp

    puts 'Enter book author:'
    author = gets.chomp

    puts 'Enter book cover state:'
    cover_state = gets.chomp

    book = Book.new(Date.today, title, author, cover_state)
    @items.push(book)
    puts 'Book added successfully.'
    save_data
  end

  def add_music_album
    puts 'Enter music album name:'
    name = gets.chomp
    puts 'Is the music album on Spotify? (yes/no):'
    on_spotify = gets.chomp.downcase == 'yes'
    album = MusicAlbum.new(name, on_spotify)
    @music_albums.push(album)
    puts 'Music album added successfully.'
    save_data
  end

  def add_genre
    puts 'Enter genre name:'
    name = gets.chomp
    genre = Genre.new(name)
    @genres.push(genre)
    puts 'Genre added successfully.'
    save_data
  end

  def add_game_author
    puts 'Enter author name:'
    name = gets.chomp
    puts 'Enter game:'
    game = gets.chomp
    author = GameAuthor.new(name, game)
    @games.push(author)
    puts 'Game author added successfully.'
    save_data
  end

  def save_data
    books_data = @books.map { |book| { 'title' => book.title, 'author' => book.author, 'genre' => book.genre } }
    music_albums_data = @music_albums.map { |album| { 'name' => album.name, 'on_spotify' => album.on_spotify } }
    genres_data = @genres.map { |genre| { 'name' => genre.name } }
    games_data = @games.map { |author| { 'name' => author.name, 'game' => author.game } }

    File.write('add_book.json', JSON.generate(books_data))
    File.write('add_music_album.json', JSON.generate(music_albums_data))
    File.write('add_genre.json', JSON.generate(genres_data))
    File.write('add_game_author.json', JSON.generate(games_data))
  end

  def display_books
    if @books.empty?
      puts 'No books found.'
    else
      puts 'List of books:'
      @books.each do |book|
        puts "Title: #{book.title}"
        puts "Author: #{book.author}"
        puts "Genre: #{book.genre}"
        puts '-' * 30
      end
    end
  end

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
  end

  def display_genres
    if @genres.empty?
      puts 'No genres found.'
    else
      puts 'List of genres:'
      @genres.each do |genre|
        puts "Name: #{genre.name}"
        puts '-' * 30
      end
    end
  end

  def display_games
    if @games.empty?
      puts 'No game authors found.'
    else
      puts 'List of game authors:'
      @games.each do |author|
        puts "Author: #{author.name}"
        puts "Game: #{author.game}"
        puts '-' * 30
      end
    end
  end

  def options
    loop do
      puts 'Please choose an option:'
      puts '1. Display all books'
      puts '2. Display all music albums'
      puts '3. Display all genres'
      puts '4. Display all game authors'
      puts '5. Add a book'
      puts '6. Add a music album'
      puts '7. Add a genre'
      puts '8. Add a game author'
      puts '9. Exit'

      choice = gets.chomp.to_i

      case choice
      when 1
        display_books
      when 2
        display_music_albums
      when 3
        display_genres
      when 4
        display_games
      when 5
        add_book
      when 6
        add_music_album
      when 7
        add_genre
      when 8
        add_game_author
      when 9
        save_data
        puts 'Thank you for using the catalog app. Goodbye!'
        break
      else
        puts 'Invalid option. Please try again.'
      end
    end
  end
end

app = App.new
app.options
