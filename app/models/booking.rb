class Booking < ActiveRecord::Base
  validate :uniqueness_of_date_range
  belongs_to :user
  belongs_to :bike
  has_many :reviews

  private
  def uniqueness_of_date_range
    errors.add(:start_date, "is not available") unless Booking.where("? >= start_date AND ? <= end_date",
                                                            start_date, start_date).count == 0
    errors.add(:end_date, "is not available") unless Booking.where("? >= start_date AND ? <= end_date",
                                                            end_date, end_date).count == 0
  end

end
