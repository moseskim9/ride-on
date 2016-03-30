class User < ActiveRecord::Base
  has_one  :profile
  has_many :bikes
  has_many :bookings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


         accepts_nested_attributes_for :profile


  before_create :initialize_profile

  def initialize_profile
      p = Profile.new() do |p|
        p.user_id = self.id
      end

      if p.save
        self.profile = p
      else
        msg = "Error generating profile for user #{p.errors}"
        logger.error  msg
        raise msg
      end
    end
end
