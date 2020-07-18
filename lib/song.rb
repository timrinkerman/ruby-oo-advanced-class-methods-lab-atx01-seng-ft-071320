class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create
    song = self.new
    song.save
    song
  end

def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end

def self.create_by_name(name)
song = self.new
song.name = name
song.save
song
end

def self.find_by_name(name)
  @@all.find do |word|
    word.name == name   
  end
end
#can I call a method using self within a method 
def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)

end

def self.alphabetical
  @@all.sort_by { |name|  name.name }
end

def self.new_from_filename(string)
  song = self.new
  array = string.split(" - ")
  array[1] = array[1].delete_suffix(".mp3")
  
  song.name = array[1]
  song.artist_name = array[0]
  
  song  
end

#"Taylor Swift - Blank Space.mp3"
def self.create_from_filename(string)
song = self.new 
array = string.split(" - ")
  array[1] = array[1].delete_suffix(".mp3")
  
  song.name = array[1]
  song.artist_name = array[0]  
song.save


end

def self.destroy_all
  @@all = []


end
end