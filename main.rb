require_relative 'app'
require_relative 'item'

# basic inputs
class Main
  def select_options
    puts 'Welcome to my app'
    puts 'Please choose an option'
    puts '1. Display all books'
    puts '2. Display all music albums'
    puts '3. Display all games'
    puts '4. Add books'
    puts '5. Add music album'
    puts '6. Add games'
    puts '7. Thats all for now'
  end

  def options(option)
    app = App.new
    case option
    when '1'
      app.display_books
    when '2'
      app.display_music_album
    when '3'
      app.display_games
    when '4'
      app.add_book
    when '5'
      app.add_music_album
    when '6'
      app.add_game
    end
  end

  def execute_app
    loop do
      select_options

      option = gets.chomp

      options(option)

      break if option == '7'
    end
  end
end

def execute_main
  main = Main.new
  main.execute_app
end

execute_main
