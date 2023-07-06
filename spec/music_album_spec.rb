require_relative '../music_album'

RSpec.describe MusicAlbum do
  let(:album) { MusicAlbum.new('Romeo & Juliet', true) }

  describe '#new' do
    it 'creates a new music album instance' do
      expect(album).to be_instance_of(MusicAlbum)
    end

    it 'sets the name correctly' do
      expect(album.name).to eq('Romeo & Juliet')
    end

    it 'sets on_spotify correctly' do
      expect(album.on_spotify).to be true
    end
  end

  describe '#to_json' do
    it 'returns the album details in JSON format' do
      expected_json = '{"name":"Romeo & Juliet","on_spotify":true}'
      expect(album.to_json).to eq(expected_json)
    end
  end
end
