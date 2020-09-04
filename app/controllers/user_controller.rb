class UserController < User::ApplicationController
  def top
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: params[:id]).where(draft: "false")
  end

  def mypage
    @user = User.find_by(id: current_user.id)
  end
end
