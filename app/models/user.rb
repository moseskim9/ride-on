class User < ActiveRecord::Base
  has_one  :profile
  has_many :bikes
  has_many :bookings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]

  accepts_nested_attributes_for :profile


  before_create :initialize_profile

  def initialize_profile
      p = Profile.new() do |p|
        p.user_id = self.id
        p.profile_image = self.picture
        p.name = self.first_name + " " + self.last_name
      end

      if p.save
        self.profile = p
      else
        msg = "Error generating profile for user #{p.errors}"
        logger.error  msg
        raise msg
      end
  end

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end
end
