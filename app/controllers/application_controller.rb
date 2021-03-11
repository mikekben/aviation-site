class ApplicationController < ActionController::Base
  
  def hello
    render html: "from local this time"
  end

  def find_airport(code)
    @found = nil
    if (!code.nil?) && (code.length() == 3)
        @found = Airport.all.find_by(iata: code)
    elsif (!code.nil?) && (code.length() == 4)
        @found = Airport.all.find_by(icao: code)
    end
    if !@found.nil?
        @found
    else
        nil
    end
  end

end
