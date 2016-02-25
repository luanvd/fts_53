class Question < ActiveRecord::Base
  enum status: [:waiting, :approved]

  validates :subject_id, presence: true
  validates :content, presence: true

  belongs_to :user
  belongs_to :subject

  has_many :question_answers, dependent: :destroy
  has_many :results
  has_many :lesson, through: :results

  accepts_nested_attributes_for :question_answers, allow_destroy: true
end
