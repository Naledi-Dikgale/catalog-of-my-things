require_relative 'item'
require 'date'

class Game < item
  attr_accessor :multiplayer, :last_played_at, :publish_date, :authors
  attr_reader :id, :title

  def initialize(multiplayer, last_played_at, publish_date, title, authors = [])
    @id = Random.rand(1..100)
    super()
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @publish_date = publish_date
    @title = title
    @authors = []
    add_authors(authors)
  end

  def add_authors(authors)
    return if authors.include?(authors)

    authors << authors
    authors.add_item(self)
  end

  def can_be_archived?
    super || (Date.today - Date.parse(@last_played_at) > 365 * 2)
  end

  private :can_be_archived?

  def to_hash
    {
      id: @id, title: @title,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      publish_date: @publish_date
    }
  end
end
