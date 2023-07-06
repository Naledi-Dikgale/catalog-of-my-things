# require_relative '../music_album'
require_relative '../genre'

# describe Genre do
#   before :each do
#     @genre = Genre.new('Comedy')
#     @item = Item.new('genre', 'author', 'label', 10)
#   end
describe Genre do
  let(:genre) { Genre.new(name) }
  let(:item) { double('Item')  }
  let(:name) { 'Comedy' }

  describe '#new' do
    it 'Creates a new music album instance' do
      # @genre.should be_an_instance_of Genre
      expect(genre.name).to eql name
    end
  end

  describe '#add_item' do
    it 'It should add new item' do
      # expect(@genre.add_item(@item)).should eql? @item
      allow(item).to receive(:genre=)
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
