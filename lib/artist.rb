class Artist
  attr_accessor :name
  @@all = []  
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    song.artist = self
    self.songs << song
  end
  
  def self.find_or_create_by_name(name)
    if self.all.detect {|artist| artist.name == name}
      self.all.detect {|artist| artist.name == name}
    else
      new_artist = self.new(name)
      new_artist
    end
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def print_songs(artist)
    Song.all.each do |song|
      if song.artist == artist
        puts song
      end
    end
  end
  
end