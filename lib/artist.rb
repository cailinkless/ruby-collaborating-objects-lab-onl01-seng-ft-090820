class Artist

    @@all = []

    attr_accessor :name

    def initialize(name)

        @name = name
        @@all << self

    end

    def self.all 
        @@all
    end

    def add_song(song)
       song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)

        if @@all.detect{|artist| artist.name == name}.nil?
            name = self.new(name)
        else
           return @@all.detect{|artist| artist.name == name} 
        end

    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end

end