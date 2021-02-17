require "test_helper"

class AirportTest < ActiveSupport::TestCase
  test "must have required elements" do
    airport = Airport.new
    assert_not airport.save, "Saved an airport without a lat, lon, city, or airport_name"
  end
  test "IATA code is proper format" do
    airport = Airport.new
    airport.iata = "ABCD"
    assert_not airport.valid?, "IATA code is too long"
    airport.iata = "AB"
    assert_not airport.valid?, "IATA code is too short"
    airport.iata = "a12"
    assert_not airport.valid?, "IATA code contains forbidden characters"
  end
  test "ICAO code is proper format" do
    airport = Airport.new
    airport.iata = "ABCDE"
    assert_not airport.valid?, "ICAO code is too long"
    airport.iata = "ABC"
    assert_not airport.valid?, "ICAO code is too short"
    airport.iata = "1234"
    assert_not airport.valid?, "ICAO code first character must be letter"
  end
end
