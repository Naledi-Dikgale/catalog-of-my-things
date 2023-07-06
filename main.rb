require_relative 'app'
require_relative 'item'

# basic inputs
# class Main
#   def select_options
#     puts 'Welcome to my app'
#     puts 'Please choose an option'
#     puts '1. Display all books'
#     puts '2. Display all music albums'
#     puts '3. Display all games'
#     puts '4. Add books'
#     puts '5. Add music album'
#     puts '6. Add games'
#     puts '7. Thats all for now'
#   end

#   def options(option)
#     app = App.new
#     case option
#     when '1'
#       app.display_books
#     when '2'
#       app.display_music_album
#     when '3'
#       app.display_games
#     when '4'
#       app.add_book
#     when '5'
#       app.add_music_album
#     when '6'
#       app.add_game
#     end
#   end

#   def execute_app
#     loop do
#       select_options

#       option = gets.chomp

#       options(option)

#       break if option == '7'
#     end
#   end
# end

# def execute_main
#   main = Main.new
#   main.execute_app
# end

# execute_main
class Main 
OPTIONS = {
    1 => :display_books,
    2 => :display_music_album,
    3 => :display_genres,
    4 => :display_game_authors,
    3 => :display_games,
    5 => :add_book,
    6 => :add_music_album,
    7 => :add_genre,
    8 => :add_game_author,
    9 => :Thats_all_for_now,
  }.freeze

  def initialize(app)
    super()
    @app = app
  end

  # def display_options
  #   <<~OPTIONS
  #     1 - Display all books
  #     2 - Display all music albums
  #     3 - Display all games
  #     4 - Add books
  #     5 - Add music album
  #     6 - Add games
  #     7 - Thats all for now
  #   OPTIONS
  # end

  def display_options
      <<~OPTIONS
      1 - Display all books
      2 - Display all music albums
      3 - Display all genres
      4 - Display all game authors
      5 - Add a book
      6 - Add a music album
      7 - Add a genre
      8 - Add a game author
      9 - Thats all for now

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

# case choice
# when 1
#   display_books
# when 2
#   display_music_albums
# when 3
#   display_genres
# when 4
#   display_games
# when 5
#   add_book
# when 6
#   add_music_album
# when 7
#   add_genre
# when 8
#   add_game_author
# when 9
#   save_data
#   puts 'Thank you for using the catalog app. Goodbye!'
#   break
# else
#   puts 'Invalid option. Please try again.'
# end