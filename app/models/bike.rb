class Bike < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :bookings
end
