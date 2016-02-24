class Subject < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true, on: :create

  has_many :lessons
  has_many :questions, dependent: :destroy
end
