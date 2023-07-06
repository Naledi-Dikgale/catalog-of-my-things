require 'date'

class Item
  attr_accessor :published_date, :genre, :label, :author


  def initialize(published_date, genre)
    @id = rand(1..1000)
    @genre = genre

    @published_date = published_date
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def can_be_archived?
    years_since_publication >= 10
  end

  def years_since_publication
    Date.today.year - @published_date.year
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self)
  end

  def label=(label)
    @label = label
    label.add_item(self)
  end

  def author=(author)
    @author = author
    author.add_item(self)
  end
end
