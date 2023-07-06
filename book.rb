require_relative 'item'

class Book < Item
  attr_accessor :title, :author, :cover_state

  def initialize(published_date, title, author, cover_state)
    super(published_date)
    # @id = rand(1..1000)
    @title = title
    @author = author
    @cover_state = cover_state
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
