require 'coordinate'
module ApplicationHelper

    def distance(first,second)
    "#{first.fast_distance_to(second).round()}km"
    end

    def rand_coord()
        Coordinate.random()
    end

    def gcmap_link(first,second)
        "http://www.gcmap.com/mapui?P=#{first.no_spaces}-#{second.no_spaces}+&MS=wls&DU=km"
    end
end
