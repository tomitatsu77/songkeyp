class UsersController < ApplicationController
  
  def show
    @user=current_user
  end
  
  def edit
    @user=current_user
  end
  
  def update
    @user = current_user
    @user.update(user_params)
    flash[:notice] ="更新しました"
    redirect_to mypage_path
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
