class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_admin?
    current_user && current_user.admin?
  end

  def verify_is_admin
    unless is_admin?
      redirect_to root_path, notice: 'You must be an admin to do that.' 
    end
  end
end
