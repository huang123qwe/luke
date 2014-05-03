class Admin::UsersController < AdminController

  set_tab :user

  def index
    @user = User.all
  end

end