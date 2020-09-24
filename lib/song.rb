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
        name = filename.split(" - ")[0]
        filename = self.new(name)
        filename.artist_name = filename.split(" - ")[1]
        return filename
    end



end