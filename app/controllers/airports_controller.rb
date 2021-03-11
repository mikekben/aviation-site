class AirportsController < ApplicationController
    #Citation: based on class instructions at https://csc324-326.sites.grinnell.edu/creating-a-simple-model-and-database/
    def list
        airport_list = Airport.all
        @airports = airport_list
    end

    def add
        @airport = Airport.new
    end

    def create
        @airport = Airport.new(airport_params)
        if @airport.save
          redirect_to list_path
        else
          render 'add'
        end
    end

    private

    def airport_params
        params.require(:airport).permit(:iata,:icao,:city,:airport_name,:region,:lat,:lon)
    end

end
