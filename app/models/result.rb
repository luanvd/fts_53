class Result < ActiveRecord::Base
  serialize :content_answer, Array

  belongs_to :lesson
  belongs_to :question
  belongs_to :question_answer
end
