require_relative 'item'
require 'json'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify

  def initialize(name, on_spotify)
    @name = name
    @on_spotify = on_spotify
  end

  def to_json(*_args)
    JSON.generate(
      {
        name: @name,
        on_spotify: @on_spotify
      }
    )
  end
end
