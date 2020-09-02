class PostController < User::ApplicationController

  def top
  end

  def new
    @postimages = PostImage.where(user_id: current_user.id)
  end

  def postimage_upload
    @postimage = PostImage.new(
      imageurl: postimage_params[:imageurl],
      user_id: current_user.id
    )
    @postimage.save
    redirect_to('/post/new')
  end

  def create

    if post_params[:preview] == "true"
      session[:preview_title] = post_params[:title]
      session[:preview_text] = post_params[:text]
      redirect_to('/preview')

    else post_params[:preview] == "fasle"

      # 下書きとして保存しない場合＝本番に反映させたい場合
      if post_params[:draft] == "fasle"
        @post = Post.new(
          title: post_params[:title], 
          text: post_params[:text], 
          user_id: current_user.id,
          draft: "fasle"
        )
        session[:preview_title].clear
        session[:preview_text].clear
      
        @post.save
        redirect_to('/')

      elsif post_params[:draft] == "true"
        @post = Post.new(
          title: post_params[:title], 
          text: post_params[:text], 
          user_id: current_user.id,
          draft: "true"
        )
        session[:preview_title].clear
        session[:preview_text].clear

        @post.save
        redirect_to('/profile')

      end
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @postimages = PostImage.where(user_id: current_user.id)
  end

  def preview

    if session[:preview_title] == nil && session[:preview_text] == nil
      redirect_to('/')
    else 
      @preview_title = session[:preview_title]
      @preview_text = session[:preview_text]
      @user = User.find_by(id: current_user.id)
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @recommend_posts = Post.all.order(id: "DESC")
  end

  def update
    if post_params[:preview] == "true"
      session[:preview_title] = post_params[:title]
      session[:preview_text] = post_params[:text]
      redirect_to('/preview')

    else post_params[:preview] == "fasle"
      # 下書きとして保存しない場合＝本番に反映させたい場合
      if post_params[:draft] == "fasle"

        @post = Post.find_by(id: params[:id]).update(
          title: post_params[:title], 
          text: post_params[:text], 
          user_id: current_user.id,
          draft: "fasle"
        )
        session[:preview_title].clear
        session[:preview_text].clear
        redirect_to('/profile')

      elsif post_params[:draft] == "true"
        @post = Post.find_by(id: params[:id]).update(
          title: post_params[:title], 
          text: post_params[:text], 
          user_id: current_user.id,
          draft: "true"
        )
        session[:preview_title].clear
        session[:preview_text].clear
        redirect_to('/profile')

      end
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to('/profile')
  end

  private
  def post_params
    params.permit(:title, :text, :preview, :draft)
  end

  def postimage_params
    params.permit(:imageurl)
  end

end