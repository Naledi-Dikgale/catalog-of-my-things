require_relative 'item'

class Genre < Item
  # attr_reader :id, :name
  attr_accessor :name
  attr_reader :items

  def initialize(genre)
    # @id = rand(1..1000)
    @name = name
    @items = []
  end

  # def add_item(item)
  #   @items << item
  #   item.genre = self if item.respond_to?(:genre)
  # end

  def to_hash
      {
        name: @name
      }
  end
end
