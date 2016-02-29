class Lesson < ActiveRecord::Base
  enum status: [:start, :testing, :unchecked, :checked]

  belongs_to :user
  belongs_to :subject

  has_many :results
  has_many :questions, through: :results
end
