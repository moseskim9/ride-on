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
Booking.destroy_all
Bike.destroy_all

Bike.create(make: 'Vespa', :model => 'S', year: '2000', engine: '50cm3', bike_type: 'scooter', rate_daily: 4, bike_image: 'http://i.marktplaats.com/00/s/NjgzWDEwMjQ=/z/dVsAAOSwe7BWvMXy/$_85.JPG')
Bike.create(make: 'Solex', :model => '3300', year: '1982', engine: '50cm3', bike_type: 'moped', rate_daily: 2, bike_image: 'http://details-of-cars.com/wp-content/uploads/parser/Velosolex-3300-7.jpg')
Bike.create(make: 'Yamaha', :model => 'DT', year: '2005', engine: '125cm3', bike_type: 'motorcycle', rate_daily: 5, bike_image: 'http://dirtrider.net/forums3/data/attachments/11/11857-da6b3a9fa5986b039afccfd83947e579.jpg')
Bike.create(make: 'BMW', :model => 'nine-T', year: '2014', engine: '1200cm3', bike_type: 'motorcycle', rate_daily: 5, bike_image: 'https://cdn.wheelson.net/photo/2016/02/01/16142948064071049216/14963925164255973376/BMW-R-nine-T-2015-plus-7-year-unlimited-warranty.jpg')
Bike.create(make: 'Vespa', :model => 'T', year: '2000', engine: '50cm3', bike_type: 'scooter', rate_daily: 5, bike_image: 'http://bikeportal.in/img/new-cars-gallery/vespa/s/desc/New-Vespa-S.jpg')
Bike.create(make: 'Honda', :model => '600rr', year: '2015', engine: '50cm3', bike_type: 'sport', rate_daily: 5, bike_image: 'https://i.ytimg.com/vi/y0cLVPQmGDk/hqdefault.jpg')
Bike.create(make: 'Suzuki', :model => 'gsxr1000', year: '2010', engine: '1000', bike_type: 'sport', rate_daily: 5, bike_image: 'http://www.1tail.com/productImages_thumbBIG/180227')
Bike.create(make: 'Kawasaki', :model => 'Ninja', year: '2000', engine: '600', bike_type: 'sport', rate_daily: 5, bike_image: 'http://www.moto123.com/ArtImages/97273/2008-kawasaki-250R-i01.jpg')
Bike.create(make: 'Harley-Davidson', :model => 'FL Bobber', year: '1954', engine: '600', bike_type: 'bobber', rate_daily: 5, bike_image: 'https://farm6.staticflickr.com/5020/5480023557_f8fe87755b.jpg')


Location.create(city: 'London', image: 'http://cdn.ek.aero/english/images/London-1_tcm233-2111842.jpg')
Location.create(city: 'Manchester', image: 'http://cdn.ek.aero/english/images/London-1_tcm233-2111842.jpg')
Location.create(city: 'Liverpool', image: 'http://cdn.ek.aero/english/images/London-1_tcm233-2111842.jpg')
Location.create(city: 'Los Angeles', image: 'http://cdn.ek.aero/english/images/London-1_tcm233-2111842.jpg')

