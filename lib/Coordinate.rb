class Coordinate

    EARTH_AVERAGE_RADIUS = 6371008.771415059 #meters

    EQUATOR_RADIUS = 6378137.0 #meters
    FLATTENING = 1.0 / 298.257223563
    POLE_RADIUS = EQUATOR_RADIUS * (1.0 - FLATTENING)





    
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
        (dist * EARTH_AVERAGE_RADIUS)/1000.0 #divide by 1000 to get kilometers
    end




    #Compute the distance (in kilometers) to another coordinate using the WGS84 ellipsoid
    #Adapted from C# program written by Ben Mikek in fall 2018
    #Algorithm adapted from Thaddeus Vincenty (https://en.wikipedia.org/wiki/Vincenty%27s_formulae)

    def accurate_distance(other)
        firstRedLat = Math.atan((1 - FLATTENING) * Math.tan(lat_rad()));
        secondRedLat = Math.atan((1 - FLATTENING) * Math.tan(other.lat_rad()));
        dLon = other.lon_rad() - lon_rad();
        oldLambda = 0;
        newLambda = dLon;
        sSigma = 0;
        cSigma = 0;
        sigma = 0;
        sAlpha = 0;
        c2Alpha = 0;
        c2xSigma = 0;
        c = 0;
        breaker = 0;
        while ((oldLambda - newLambda).abs() >= 10.0**-10 && breaker < 1000)
            breaker += 1
            oldLambda = newLambda;
            sSigma = Math.sqrt(((Math.cos(secondRedLat) * Math.sin(oldLambda))**2) + (((Math.cos(firstRedLat) * Math.sin(secondRedLat)) - (Math.sin(firstRedLat) * Math.cos(secondRedLat) * Math.cos(oldLambda)))**2))
            cSigma = (Math.sin(firstRedLat) * Math.sin(secondRedLat)) + (Math.cos(firstRedLat) * Math.cos(secondRedLat) * Math.cos(oldLambda))
            sigma = Math.atan2(sSigma, cSigma)
            sAlpha = (Math.cos(firstRedLat) * Math.cos(secondRedLat) * Math.sin(oldLambda)) / Math.sin(sigma)
            c2Alpha = 1 - (sAlpha**2)
            c2xSigma = Math.cos(sigma) - ((2.0 * Math.sin(firstRedLat) * Math.sin(secondRedLat)) / c2Alpha)
            c = 0.125 * FLATTENING * c2Alpha * (4.0 + (FLATTENING * (4.0 - (3.0 * c2Alpha))))
            newLambda = dLon + ((1.0 - c) * FLATTENING * sAlpha * (sigma + (c * sSigma * (c2xSigma + (c * cSigma * (-1.0 + (2.0 * (c2xSigma**2))))))));
        end
        uSq = c2Alpha * (((EQUATOR_RADIUS**2) - (POLE_RADIUS**2)) / (POLE_RADIUS**2));
        a = 1 + ((uSq / 16384.0) * (4096.0 + (uSq * (-768.0 + (uSq * (320.0 - (175.0 * uSq)))))));
        b = (uSq / 1024.0) * (256.0 + (uSq * (-128.0 + (uSq * (320.0 - (175.0 * uSq))))));
        dSigma = b * sSigma * (c2xSigma + (0.25 * b * ((cSigma * (-1.0 + (2.0 * (c2xSigma**2)))) - ((1.0 / 6.0) * b * c2xSigma * (-3.0 + (4.0 * (sSigma**2))) * (-3.0 + (4.0 * (c2xSigma**2)))))));
        totalDistance = POLE_RADIUS * a * (sigma - dSigma);
        return totalDistance / 1000.0 # divide by 1000 for kilometers
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