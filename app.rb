require './modules/music_album_module'
require_relative './music_album'
require 'json'

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
