require_relative 'item'

class Book < Item
  # attr_reader :id
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
      # id: @id,
      published_date: @published_date,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end

  def can_be_archived?
    if super || cover_state == 'bad'
      true
    else
      false
    end
  end
end