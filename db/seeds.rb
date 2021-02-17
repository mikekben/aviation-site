# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Citation: Official names and lat/lon were found on each airport's Wikipedia entry

Airport.create(iata: "ORD", icao: "KORD", region: "US-IL", airport_name: "O'Hare International Airport", city: "Chicago", lat: 41.978611, lon: -87.904722)
Airport.create(iata: "LJU", icao: "LJLJ", region: "SI-012", airport_name: "Ljubljana Jože Pučnik Airport", city: "Ljubljana", lat: 46.224444, lon: 14.456111)
Airport.create(iata: "MEL", icao: "YMML", region: "AU-VIC", airport_name: "Melbourne Airport", city: "Melbourne", lat: -37.673333, lon: 144.843333)
Airport.create(iata: "ACC", icao: "DGAA", region: "GH-AA", airport_name: "Kotoka International Airport", city: "Accra", lat: 5.604667, lon: -0.167389)