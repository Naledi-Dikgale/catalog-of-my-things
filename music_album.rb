require_relative 'item'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify

  def initialize(name, on_spotify)
    super(genre, author, label, publish_date)
    @name = name
    @on_spotify = on_spotify
    @archived = archived
  end

  def can_be_archived?
    return true if @archived && @on_spotify == true
    return false unless @archived
  end

  def to_json(*_args)
    JSON.generate(
      {
        name: @name,
        on_spoify: @on_spotify
      }
    )
  end
end
