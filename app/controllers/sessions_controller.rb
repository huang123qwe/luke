class SessionsController < Devise::SessionsController

  def auth
    Rails.logger.debug 'users'
    Rails.logger.debug request.env["omniauth.auth"]
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
