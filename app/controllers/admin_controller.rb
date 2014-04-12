class AdminController < ActionController::Base
  before_filter :authenticate_admin!
  layout 'admin'

  def require_admin
    unless current_admin
      redirect_to new_admin_session_path
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    return users_path
  end

end