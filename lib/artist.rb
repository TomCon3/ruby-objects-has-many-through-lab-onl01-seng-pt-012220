class Artist
  attr_accessor :name
  
  @@all = []

  def initialize(name)
    @name = name
    save
  end
  
  def save
    @@all << self
  end
  
  def new_song(name, artist = self, genre)
    Song.new(name, artist, genre)
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def genres
    Song.all.collect {|song| song.genre}
  end
  
  def self.all
    @@all
  end
end