require 'PairPath'
class StaticPagesController < ApplicationController
  def home
  end

  def info
  end

  def about
  end

  def distance
    @route = nil
  end

  def calculate
      #Get the string representing the route
      @route = params[:query]
      @waypoints = @route.split('-')
      @pairs = []
      #make each pair of airports in the path
      for i in 0 .. (@waypoints.length() - 2)
        @pairs.append(PairPath.new(find_airport(@waypoints.at(i)),find_airport(@waypoints.at(i+1))))
      end
      #compute the total distance
      @total = @pairs.map {|pairPath| pairPath.distance}
      @total = @total.inject(0, :+)

      @total_path = "http://www.gcmap.com/mapui?P=#{@route}+&MS=wls&DU=km"



      render 'distance'
  end
end
