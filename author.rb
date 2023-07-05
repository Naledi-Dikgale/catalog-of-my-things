require_relative 'item'

class Author < Item
  attr_reader :id, :first_name, :last_name, :items

  @id_counter = 0

  def initialize(first_name = '', last_name = '', _items = [])
    super()
    @id_counter ||= 0
    @id_counter += 1
    @id = @id_counter
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def self.json_create(object)
    new(object['first_name'], object['last_name'], object['items'])
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.add_author(self)
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def to_hash
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name,
      items: @items.map(&:to_hash)
    }
  end

  class << self
    attr_accessor :id_counter
  end
  @id_counter = 0
end

class Foo
  def bar
    Author.id_counter = 42
  end
end
