require_relative '../music_album'


describe MusicAlbum do
  let(:published_date) { '2022-01-01' }
  let(:name) { 'Album Name' }
  let(:genre) { 'Rock' }
  let(:on_spotify) { true }
  subject { described_class.new(published_date, name, genre, on_spotify) }

  describe '#initialize' do
    it 'assigns the correct values to instance variables' do
      expect(subject.instance_variable_get(:@published_date)).to eq(published_date)
      expect(subject.instance_variable_get(:@name)).to eq(name)
      expect(subject.instance_variable_get(:@genre)).to eq(genre)
      expect(subject.instance_variable_get(:@on_spotify)).to eq(on_spotify)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with the correct keys and values' do
      expected_hash = {
        published_date: published_date,
        name: name,
        genre: genre,
        on_spotify: on_spotify
      }
      expect(subject.to_hash).to eq(expected_hash)
    end
  end
end
