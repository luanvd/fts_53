class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = "change@me"
  TEMP_EMAIL_REGEX = /\Achange@me/

  enum role: [:member, :admin]

  devise :database_authenticatable, :registerable, :rememberable, :validatable,
    :omniauthable

  has_many :lessons
  has_many :questions

  validates :name, presence: true
  validates_format_of :email, without: TEMP_EMAIL_REGEX, on: :update

  class << self
    def find_for_oauth auth, signed_in_resource = nil
      identity = Identity.find_for_oauth auth

      user = signed_in_resource ? signed_in_resource : identity.user

      if user.nil?
        email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
        email = auth.info.email if email_is_verified
        user = User.find_by(email: email) if email

        if user.nil?
          user = User.new(
            name: auth.extra.raw_info.name,
            email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
            password: "password"
          )
          user.save!
        end
      end

      if identity.user != user
        identity.user = user
        identity.save!
      end
      user
    end
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end
