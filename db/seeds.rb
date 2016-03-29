# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Bike.create([{ make: 'Truimph'}, { :model 'zepher' }, {engine: '600'}, {year: '1974'},
#   {type: 'standard'}, {rate_daily: 70}, ])
#
Bike.destroy_all

Bike.create(make: 'Vespa', :model => 'S', year: '2000', engine: '50cm3', bike_type: 'scooter', rate_daily: 4, bike_image: 'http://i.marktplaats.com/00/s/NjgzWDEwMjQ=/z/dVsAAOSwe7BWvMXy/$_85.JPG')
Bike.create(make: 'Solex', :model => '3300', year: '1982', engine: '50cm3', bike_type: 'moped', rate_daily: 2, bike_image: 'http://details-of-cars.com/wp-content/uploads/parser/Velosolex-3300-7.jpg')
Bike.create(make: 'Yamaha', :model => 'DT', year: '2005', engine: '125cm3', bike_type: 'motorcycle', rate_daily: 5, bike_image: 'http://dirtrider.net/forums3/data/attachments/11/11857-da6b3a9fa5986b039afccfd83947e579.jpg')
Bike.create(make: 'BMW', :model => 'nine-T', year: '2014', engine: '1200cm3', bike_type: 'motorcycle', rate_daily: 5, bike_image: 'https://cdn.wheelson.net/photo/2016/02/01/16142948064071049216/14963925164255973376/BMW-R-nine-T-2015-plus-7-year-unlimited-warranty.jpg')
Bike.create(make: 'Vespa', :model => 'T', year: '2000', engine: '50cm3', bike_type: 'scooter', rate_daily: 5, bike_image: 'http://bikeportal.in/img/new-cars-gallery/vespa/s/desc/New-Vespa-S.jpg')
