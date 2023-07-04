require_relative '../music_album'
require_relative '../genre'

module CreateMusicAlbum
  def add_music_album
    puts 'What is the name of your album'
    name = gets.chomp.to_s
    puts 'What is the genre of you album'
    gnr = gets.chomp.to_s
    puts 'Is your album on spottify [Y/N]'
    on_spotify = false
    is_on_spotify = gets.chomp
    on_spotify = true if is_on_spotify == 'Y'
    music = MusicAlbum.new(name, on_spotify)
    genre = Genre.new(gnr)

    @music_albums.push(music)
    @genres.push(genre)
    puts 'Album created!'
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'List of music album is empty'
    else
      @music_albums.each do |album|
        puts "'Music album name: #{album.name}' on spotify: #{album.on_spotify}"
      end
    end
  end

  def list_all_genres
    if @genres.empty?
      puts 'List of genres is empty'
    else
      @genres.each do |genre|
        puts "Genres name: #{genre.name}"
      end
    end
  end
end
