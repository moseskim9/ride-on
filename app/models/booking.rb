class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :bike
  belongs_to :reviews

end
