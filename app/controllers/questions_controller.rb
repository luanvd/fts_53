class QuestionsController < ApplicationController
  load_and_authorize_resource
  before_action :load_subjects, only: [:new, :edit]

  def index
    @questions = current_user.questions
  end

  def show
    @question_answers = @question.question_answers
  end

  def new
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

  def edit
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = t "question.update_success"
      redirect_to @question
    else
      flash[:warning] = t "question.update_failed"
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t "question.delete_success"
    else
      flash[:danger] = t "question.delete_failed"
    end
    redirect_to questions_path
  end

  private
  def load_subjects
    @subjects = Subject.all
  end

  def question_params
    params.require(:question).permit :id, :subject_id, :content, :status,
      :user_id, question_answers_attributes: [:id, :content, :correct,
      :_destroy]
  end
end
