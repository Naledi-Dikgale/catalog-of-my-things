require_relative 'app'
require_relative 'item'

class Main
  OPTIONS = {
    1 => :display_books,
    2 => :display_music_album,
    3 => :display_genres,
    4 => :display_games,
    5 => :add_book,
    6 => :add_music_album,
    7 => :add_genre,
    8 => :add_game,
    9 => :add_game_author,
    10 => :exit
  }.freeze

  def initialize(app)
    super()
    @app = app
  end

  def display_options
    <<~OPTIONS
      1 - Display all books
      2 - Display all music albums
      3 - Display genres
      4 - Display all games
      5 - Add books
      6 - Add music album
      7 - Add genre
      8 - Add game
      9 - Add game author
      10 - Thats all for now
    OPTIONS
  end

  def handle_options(option)
    if OPTIONS.key?(option)
      selected_option = OPTIONS[option]
      return exit if selected_option == :exit

      @app.send(selected_option)
    else
      puts 'Invalid option'
    end
  end
end

# execute_main
class Library
  def initialize
    @app = App.new
    @menu = Main.new(@app)
  end

  def run
    puts 'Welcome to the App!'
    loop do
      puts @menu.display_options
      option = gets.chomp.to_i
      @menu.handle_options(option)
    end
  end
end

Library.new.run
