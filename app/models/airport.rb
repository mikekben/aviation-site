#Citation: some validation operations found at https://guides.rubyonrails.org/active_record_validations.html
#Regular expressions tested with https://regex101.com/

require 'Coordinate'

class Airport < ApplicationRecord
    validates :iata, uniqueness: true, format: {with: /[A-Z]{3}/}
    validates :icao, uniqueness: true, format: {with: /[A-Z][A-Z0-9]{3}/}
    validates :region, presence: true, format: {with: /([A-Z][A-Z]-\w{1,3})|([A-Z][A-Z])/}
    validates :airport_name, presence: true, uniqueness: true
    validates :city, presence: true
    validates :lat, presence: true, numericality: true
    validates :lon, presence: true, numericality: true

    def location()
        Coordinate.new(lat,lon)
    end

    # for the future: some methods display UI-friendly country names
end
