class QuestionAnswer < ActiveRecord::Base
  belongs_to :result
  belongs_to :question
end
