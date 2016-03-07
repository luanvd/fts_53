class User < ActiveRecord::Base
  enum role: [:member, :admin]

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :lessons
  has_many :questions

  class << self
    def send_statistic_when_end_of_month
      User.all.each do |user|
        UserMailer.send_statistic_when_end_of_month(user).deliver_now
      end
    end
  end
end
