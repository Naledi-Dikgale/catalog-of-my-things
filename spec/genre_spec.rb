# spec/genre_spec.rb
require_relative '../genre'

describe Genre do
  describe '#new' do
    it 'creates a new genre instance' do
      genre = Genre.new('Comedy')
      expect(genre).to be_an_instance_of(Genre)
    end
  end

  describe '#add_item' do
    it 'adds a new item' do
      genre = Genre.new('Comedy')
      item = double('item')
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
