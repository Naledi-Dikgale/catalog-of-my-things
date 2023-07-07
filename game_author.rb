class GameAuthor
  attr_accessor :firstname, :lastname, :items
  attr_reader :id

  def initialize(firstname, lastname)
    @id = rand(1...1000)
    @firstname = firstname
    @lastname = lastname
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_hash
    {
      id: @id,
      firstname: @firstname,
      lastname: @lastname,
      items: @items.map(&:to_hash)
    }
  end
end
