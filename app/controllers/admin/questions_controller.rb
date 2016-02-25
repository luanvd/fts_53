class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
    Settings.number_question.times do
      @question.question_answers.build
    end
  end

  def edit
  end

  def create
    if @question.save
      flash[:success] = t "question.create_success"
      redirect_to [:admin, @question]
    else
      flash[:warning] = t "question.create_failed"
      render :new
    end
  end

  def show
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = t "question.update_success"
      redirect_to [:admin, @question]
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
    redirect_to [:admin, :questions]
  end

  private
  def question_params
    params.require(:question).permit :subject_id, :content, :status,
      question_answers_attributes: [:id, :content, :correct, :_destroy]
  end
end
