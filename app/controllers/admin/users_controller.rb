class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def create
    if @user.save
      flash[:success] = t "user.create_success"
      redirect_to [:admin, @user]
    else
      flash[:warning] = t "user.create_failed"
      render :new
    end
  end

  def new
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "user.update_success"
      redirect_to [:admin, @user]
    else
      flash[:warning] = t "user.update_failed"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user.delete_success"
    else
      flash[:danger] = t "user.delete_failed"
    end
    redirect_to [:admin, :users]
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit :id, :name, :email, :password,
      :password_confirmation, :role, :chatworkid
  end
end
