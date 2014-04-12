class Admin::SessionsController < Devise::SessionsController

  layout "admin_devise_layout"

  def auth
    Rails.logger.debug 'admin'
    Rails.logger.debug request.env["omniauth.auth"]
    redirect_to admin_root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end