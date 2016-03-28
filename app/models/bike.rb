class Bike < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :bookings
  has_many :reviews, :through => :bookings
  has_many :users, :through => :bookings
end
