class Question < ActiveRecord::Base
  enum status: [:waiting, :approved]

  belongs_to :user
  belongs_to :subject

  has_many :question_answers
  has_many :results
  has_many :lesson, through: :results
end
