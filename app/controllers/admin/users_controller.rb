class Admin::UsersController < AdminController

  def index
    @user = User.all
  end

end