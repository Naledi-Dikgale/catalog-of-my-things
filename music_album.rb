require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify)
    super(genre, author, label, publish_date)
    @on_spotify = on_spotify
    @archived = archived
  end

  def can_be_archived?
    return true if @archived || @on_spotify == true
    return false unless @archived
  end
end
