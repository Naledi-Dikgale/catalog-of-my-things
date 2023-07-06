require_relative 'item'

class Book < Item
  attr_accessor :title, :author, :cover_state

  def initialize(published_date, title, author, cover_state)
    super(published_date)
    # @id = rand(1..1000)
 game-update
  def initialize(published_date, title, author, cover_state)
    super(published_date)
    # @id = rand(1..1000)
  def initialize(title, author, cover_state)
 dev
    @title = title
    @author = author
    @cover_state = cover_state
  end

  def to_hash
    {
 game-update
      # id: @id,
 dev
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