require_relative 'spec_helper'

describe Genre do
  before :each do
    @genre = Genre.new('Comedy')
    @item = Item.new('genre', 'author', 'label', 10)
  end

  describe '#new' do
    it 'Creates a new music album instance' do
      @genre.should be_an_instance_of Genre
    end
  end

  describe '#add_item' do
    it 'It should add new item' do
      expect(@genre.add_item(@item)).should eql? @item
    end
  end
end
