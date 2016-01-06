class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def downgrade
    @user = current_user
    @user.standard!

    flash[:notice] = "Your account has been changed to the Free Plan."
    redirect_to user_path
  end
end
