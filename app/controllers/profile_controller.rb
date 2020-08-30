class ProfileController < User::ApplicationController
  def top
    @user = User.find_by(id: current_user.id)
    if @user.name == nil
      render("profile/new")
    end
  end

  # 編集画面
  def edit
    @user = User.find_by(id: current_user.id)
  end
  
  def iconimage_edit
    @user = User.find_by(id: current_user.id)
  end

  def coverimage_edit
    @user = User.find_by(id: current_user.id)
  end

  def name_edit
    @user = User.find_by(id: current_user.id)
  end

  def text_edit
    @user = User.find_by(id: current_user.id)
  end

  # updateする
  def update
    @user = User.find_by(id: current_user.id).update(profile_params)
    redirect_to('/profile')
  end

  def iconimage_update
    @user = User.find_by(id: current_user.id).update(iconimage_params)
    redirect_to('/profile')
  end

  def coverimage_update
    @user = User.find_by(id: current_user.id).update(coverimage_params)
    redirect_to('/profile')
  end

  def name_update
    @user = User.find_by(id: current_user.id).update(name_params)
    redirect_to('/profile')
  end

  def text_update
    @user = User.find_by(id: current_user.id).update(text_params)
    redirect_to('/profile')
  end

  private

  def profile_params
    params.permit(:name, :iconimageurl, :coverimageurl, :profile, :selfideal)
  end

  def iconimage_params
    params.permit(:iconimageurl)
  end

  def coverimage_params
    params.permit(:coverimageurl)
  end

  def text_params
    params.permit(:profile, :selfideal)
  end

  def name_params
    params.permit(:name)
  end
end
