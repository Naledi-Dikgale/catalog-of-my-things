class Label
  attr_reader :title, :items

  def initialize(title)
    @title = title
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_hash
    {
      title: @title,
      items: @items.map(&:to_hash)
    }
  end
end
