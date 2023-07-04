class App
  attr_accessor :books, :music_album, :games

  def initialize
    @books = []
    @music_album = []
    @games = []
  end

  include Games
  include Book
  include MusicAlbum
end