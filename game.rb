require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date, :authors

<<<<<<< HEAD
  # attr_reader :id, :title

  def initialize(_single_player, last_played_at, publish_date)
    super(last_played_at, publish_date)
    @last_played_at = last_played_at
    @publish_date = publish_date
  end

  def to_hash
    {
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      published_date: @published_date
    }
=======
  def initialize(title, multiplayer, last_played_at, publish_date, authors = [])
    @id = Random.rand(1..1000)
    super()
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @publish_date = Date.parse(publish_date).strftime('%Y/%m/%d')
    @can_be_archived = can_be_archived?
    @authors = []
    add_authors(authors)
  end

  def add_authors(authors)
 game-update
    authors.each { |author| add_author(author) }
  end

  def add_author(author)
    return if authors.include?(author)

    authors << author
    author.add_item(self)
    return if @authors.include?(authors)

    @authors << authors
    authors.add_item(self)
dev
>>>>>>> 0edfcd950edd0e42ce088f93f1a1ebbfdb1fc522
  end

  def can_be_archived?
    super || (Date.today - Date.parse(@last_played_at) > 365 * 2)
  end
<<<<<<< HEAD
=======

  private :can_be_archived?

  def to_hash
    {
      id: @id,
      title: @title,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      publish_date: @publish_date
    }
  end
>>>>>>> 0edfcd950edd0e42ce088f93f1a1ebbfdb1fc522
end

