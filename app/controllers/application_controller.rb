class ApplicationController < ActionController::Base
  before_action :set_current_user #lo hara antes de cualquier request

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: "Debes tener iniciada la sesión" if Current.user.nil?
  end
end
