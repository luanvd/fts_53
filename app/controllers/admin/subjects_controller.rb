class Admin::SubjectsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def create
    if @subject.save
      SubjectNotificationService.new(@subject).mail_to_user_when_create
      flash[:success] = t "subject.create_success"
      redirect_to [:admin, @subject]
    else
      flash[:warning] = t "subject.create_failed"
      render :new
    end
  end

  def new
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "subject.update_success"
      redirect_to [:admin, @subject]
    else
      flash[:warning] = t "subject.update_failed"
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = t "subject.delete_success"
    else
      flash[:danger] = t "subject.delete_failed"
    end
    redirect_to [:admin, :subjects]
  end

  def show
  end

  private
  def subject_params
    params.require(:subject).permit :id, :name
  end
end
