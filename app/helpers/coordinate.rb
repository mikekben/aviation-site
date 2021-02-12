class Coordinate

    EARTH_RADIUS = 6371008.771415059 #meters
    
    @@latitude = 0.0
    @@longitude = 0.0
    def initialize(lat, lon)
        @latitude = lat
        @longitude = (lon==-180?180:lon)
    end

    #Return a random coordinate
    def self.random()
        Coordinate.new(rand(-90.0..90.0),rand(-180.0..180.0))
    end

    #Get the character representing North or South
    def lat_char()
        @latitude >= 0 ? 'N' : 'S'
    end
    #Get the character representing East or West
    def lon_char()
        @longitude >= 0 ? 'E' : 'W'
    end

    #Get the latitude in radians (for distance computations)
    def lat_rad()
        @latitude * (Math::PI / 180.0)
    end
    #Get the longitude in radians (for distance computations)
    def lon_rad()
        @longitude * (Math::PI / 180.0)
    end

    #Compute the distance (in kilometers) to another coordinate, assuming the earth is a sphere
    #Adapted from C# program written by Ben Mikek in summer 2016
    #Algorithm adapted from Karl Swartz, http://www.gcmap.com/faq/gccalc#gchow
    def fast_distance_to(other)
        dist = Math.acos((Math.sin(lat_rad()) * Math.sin(other.lat_rad())) + (Math.cos(lat_rad()) * Math.cos(other.lat_rad()) * Math.cos(other.lon_rad() - lon_rad())))
        dist += dist < 0 ? Math::PI : 0
        (dist * EARTH_RADIUS)/1000.0 #divide by 1000 to get kilometers
    end


    #Convert to string
    def to_s
        "#{lat_char()}#{@latitude.abs().round(6)} #{lon_char()}#{@longitude.abs().round(6)}"
    end

    #Convert to a string without spaces (for use with web addresses,etc)
    def no_spaces
        "#{lat_char()}#{@latitude.abs().round(6)}#{lon_char()}#{@longitude.abs().round(6)}"
    end
end