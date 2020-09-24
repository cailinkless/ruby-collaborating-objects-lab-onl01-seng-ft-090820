require 'pry'

class Song

    @@all = []

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name=(name)
        Artist.find_or_create_by_name(name).add_song(self)
    end

    def self.new_by_filename(filename)
        
        title = filename.split(" - ")[1]
        new_song = self.new(title)
        new_song.artist_name = filename.split(" - ")[0]
        return new_song
    end



end