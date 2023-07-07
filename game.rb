require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :published_date, :authors

  def initialize(multiplayer, last_played_at, published_date)
    super(last_played_at, published_date)
    @last_played_at = last_played_at
    @published_date = published_date
    @multiplayer = multiplayer
  end

  def to_hash
    {
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      published_date: @published_date
    }
  end

  def can_be_archived?
    super || (Date.today - Date.parse(@last_played_at) > 365 * 2)
  end
end
