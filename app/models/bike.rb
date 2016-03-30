class Bike < ActiveRecord::Base

  mount_uploader :bike_image, PhotoUploader

  belongs_to :location
  belongs_to :user

  has_many :bookings
  has_many :reviews, :through => :bookings
  has_many :users,   :through => :bookings

  scope :latest, -> { order(created_at: :desc).limit(5) }

end
