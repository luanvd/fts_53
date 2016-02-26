class QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
    @questions = current_user.questions
  end

  def show
    @question_answers = @question.question_answers
  end

  def new
    @subjects = Subject.all
  end

  def create
    if @question.save
      flash[:sucess] = t "question.create_success"
      redirect_to @question
    else
      flash[:warning] = t "question.create_failed"
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit :id, :subject_id, :content, :status,
      :user_id, question_answers_attributes: [:id, :content, :correct,
      :_destroy]
  end
end
