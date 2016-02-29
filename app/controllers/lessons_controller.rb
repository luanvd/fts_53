class LessonsController < ApplicationController
  load_and_authorize_resource

  def index
    @lessons = @lessons.page(params[:page]).per Settings.per_page
    @subjects = Subject.all
    @lesson = current_user.lessons.new
  end

  def create
    if @lesson.save
      flash[:success] = t "lesson.create_success"
    else
      flash[:danger] = t "lesson.create_failed"
    end
    redirect_to lessons_path
  end

  private
  def lesson_params
    params.require(:lesson).permit :id, :user_id, :subject_id
  end
end
