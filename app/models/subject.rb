class Subject < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}
  validates :name, uniqueness: true, on: :create

  has_many :lessons
  has_many :questions, dependent: :destroy
end
