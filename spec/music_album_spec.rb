require_relative 'spec_helper'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('Romeo & juliete', true)
  end

  describe '#new' do
    it 'Creates a new music album instance' do
      @music_album.should be_an_instance_of MusicAlbum
    end
  end

  describe '#can_be_archived' do
    it 'It should reurn true if archived or on_spoify is equals true ' do
      expect(@music_album.can_be_archived?).to eql false
    end
  end

  describe '#name' do
    it 'Name should be Romeo & juliete' do
      expect(@music_album.name).to eql 'Romeo & juliete'
    end
  end
end
