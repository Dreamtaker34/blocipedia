class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def downgrade
    @user = current_user
    @user.standard!

    flash[:notice] = "Your account has been changed to the Free Plan."
    redirect_to user_path(current_user)
  end
end
