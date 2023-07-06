require_relative 'item'

class Book < Item
  attr_accessor :title, :author, :cover_state, :genre

  def initialize(published_date, title, author, cover_state, genre)
    super(published_date, genre)
    @title = title
    @author = author
    @cover_state = cover_state
    @genre = genre
  end

  def to_hash
    {
      published_date: @published_date,
      title: @title,
      author: @author,
      cover_state: @cover_state
    }
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end