require_relative 'item'

class Book < Item
  attr_accessor :title, :author, :cover_state, :genre

<<<<<<< HEAD
  def initialize(published_date, title, author, cover_state, genre)
    super(published_date, genre)
=======
  def initialize(published_date, title, author, cover_state)
    super(published_date)
    # @id = rand(1..1000)
 game-update
  def initialize(published_date, title, author, cover_state)
    super(published_date)
    # @id = rand(1..1000)
  def initialize(title, author, cover_state)
 dev
>>>>>>> 0edfcd950edd0e42ce088f93f1a1ebbfdb1fc522
    @title = title
    @author = author
    @cover_state = cover_state
    @genre = genre
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