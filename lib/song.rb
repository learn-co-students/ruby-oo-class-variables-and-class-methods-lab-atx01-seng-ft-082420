require 'pry'

class Song
    attr_accessor :name, :artist, :genre
    @@all = []
    @@genres = []
    @@artists = []
    @@count = 0
   

    def initialize(name, artist, genre)
        @name= name
        @artist= artist
        @genre= genre
        @@count+= 1
        @@all << self
        @@genres << genre
        @@artists << artist
    end

    def self.count
        @@count
    end

    def self.genres
        @@genres.uniq
    end

    def self.artists
        @@artists.uniq
    end

    #I peeked at the solution for this particular method
    # so I feel the need to explain what is happening in it.
    def self.genre_count 
        # we use the self keyword to refer to the Song class
        genre_count = {} 
        #we create an empty hash to contain our data
        @@genres.each do |genre|
        #we use the each enumerable to iterate through our @@genre array
          if genre_count[genre]
            genre_count[genre] += 1 
          else
            genre_count[genre] = 1
          end
          #This conditional statement sets the key and value for our 
          #genre_count hash. If the key does not already exist, the key 
          # will be set and its value will be set to one as described by 
          #our else statement. In the event that the key does already exist, 
          #our if statement sets the value equal to the previous value plus one.
        end
        genre_count
        #we rely on implicit return to return the genre_count hash. This hash's 
        #keys are genres of songs contained in the @@genre array
        #and its values are the number of songs 
        #in the song class array that belong to that particular key's genre.
      end
    
    def self.artist_count
        artist_count = {}
        @@artists.each do |artist|
            if artist_count[artist]
                artist_count[artist]+=1
            else
                artist_count[artist]=1
            end
        end
        artist_count
    end

end
# Song.new("graceless", "the national", "alternative")
# Song.new("movement", "oliver tree", "alternative")