class QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
    @questions = current_user.questions
  end
end
