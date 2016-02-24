class User < ActiveRecord::Base
  enum role: [:member, :admin]

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :lessons
  has_many :questions
end
