class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :ensure_signup_complete
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_url
  end

  def ensure_signup_complete
    return if action_name == "finish_signup"
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for :account_update do |u|
      u.permit :name, :email, :chatworkid, :password, :password_confirmation, :current_password
    end

    devise_parameter_sanitizer.for :sign_up do |u|
      u.permit :name, :email, :chatworkid, :password, :password_confirmation
    end
  end

  def current_ability
    controller_name_segments = params[:controller].split "/"
    controller_name_segments.pop
    controller_namespace = controller_name_segments.join("/").camelize
    Ability.new current_user, controller_namespace
  end
end
