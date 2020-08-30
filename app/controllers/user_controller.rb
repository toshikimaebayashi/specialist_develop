class UserController < User::ApplicationController
  def top
    @user = User.find_by(id: params[:id])
  end

  def mypage
    @user = User.find_by(id: current_user.id)
  end
end
