class Artist 
  
  attr_accessor :name, :songs
    @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def songs 
    Song.all.select{|song| song.artist == self}
  end
  
  def add_song(song)
    song.artist = self 
  end
  
  def self.find_or_create_by_name(name)
    result = Artist.all.find{|artist| artist.name == name}
    if !result 
      result = Artist.new(name)
    end
    result
  end
  
  def print_songs
    puts self.songs.map {|song| song.name}
  end
end
  
  
  
  