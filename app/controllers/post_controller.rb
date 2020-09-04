class PostController < User::ApplicationController

  def top
  end

  def new
    @postimages = PostImage.where(user_id: current_user.id).order(id: "DESC").last(10)
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
      @post = Post.new(
        title: post_params[:title], 
        text: post_params[:text], 
        user_id: current_user.id,
        draft: post_params[:draft]
      )
      if session[:preview_title]
        session[:preview_title].clear
      end

      if session[:preview_text]
        session[:preview_text].clear
      end
      
      @post.save

      flash[:notice] = "投稿しました！"
      redirect_to('/')
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @postimages = PostImage.where(user_id: current_user.id).order(id: "DESC").last(10)
  end

  def preview

    if session[:preview_title] == nil && session[:preview_text] == nil
      redirect_to('/')
    else 
      @preview_title = session[:preview_title]
      @preview_text = session[:preview_text]
      @user = User.find_by(id: current_user.id)
      flash[:notice] = "これはプレビューモードです"
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @recommend_posts = Post.where(draft: "false").order(id: "DESC")
  end

  def update
    if post_params[:preview] == "true"
      session[:preview_title] = post_params[:title]
      session[:preview_text] = post_params[:text]
      redirect_to('/preview')

    else post_params[:preview] == "fasle"
      
      @post = Post.find_by(id: params[:id])
      @post.update(
        title: post_params[:title], 
        text: post_params[:text], 
        user_id: current_user.id,
        draft: post_params[:draft]
      )

      if session[:preview_title]
        session[:preview_title].clear
      end

      if session[:preview_text]
        session[:preview_text].clear
      end

      redirect_to('/')
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