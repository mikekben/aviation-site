class AirportsController < ApplicationController
    #Citation: based on class instructions at https://csc324-326.sites.grinnell.edu/creating-a-simple-model-and-database/
    def list
        airport_list = Airport.all
        @airports = airport_list
     end

end
