class QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
    @questions = current_user.questions
  end

  def show
    @question_answers = @question.question_answers
  end
end
