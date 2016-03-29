class Review < ActiveRecord::Base
  belongs_to :booking
  has_many :users, :through => :bookings
end
