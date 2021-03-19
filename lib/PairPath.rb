class PairPath

    @@origin
    @@destination

    def initialize(orig, dest)
        @origin = orig
        @destination = dest
    end

    def distance()
        if @origin.nil? || @destination.nil?
            0
        else
            #@origin.location().fast_distance_to(@destination.location)
            @origin.location().accurate_distance(@destination.location)
        end
    end

    def to_s
        "#{@origin.iata.nil? ? @origin.icao : @origin.iata}-#{@destination.iata}"
    end

    def origin_label()
        if @origin.nil?
            "nil"
        else
            "#{@origin.iata.nil? ? @origin.icao : @origin.iata} (#{@origin.city})"
        end
    end

    def destination_label()
        if @destination.nil?
            "nil"
        else
            "#{@destination.iata.nil? ? @destination.icao : @destination.iata} (#{@destination.city})"
        end
    end

    def gcmap_link()
        if @origin.nil? || @destination.nil?
            "nil"
        else
            "http://www.gcmap.com/mapui?P=#{@origin.iata.nil? ? @origin.icao : @origin.iata}-#{@destination.iata.nil? ? @destination.icao : @destination.iata}+&MS=wls&DU=km"
        end
    end
end