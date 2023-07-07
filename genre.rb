require_relative 'item'

class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @name = name
    @items = []
  end

  def to_hash
    {
      name: @name
    }
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
