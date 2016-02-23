class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  has_many :results
  has_many :questions, through: :results
end
