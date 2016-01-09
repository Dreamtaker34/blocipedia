class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def downgrade
    @user = current_user
    @user.standard!
    @user.wikis.each do |wiki|
      wiki.update_attributes!(private: false)
    end

    flash[:notice] = "Your account has been changed to the Free Plan."
    redirect_to user_path(current_user)
  end
end
