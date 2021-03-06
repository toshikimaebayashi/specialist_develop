class PostController < User::ApplicationController

  def top
  end

  def new
    @postimages = PostImage.where(user_id: current_user.id).order(id: "DESC").first(10)
    @postText
    @postTitle

    if session[:title]
      @postTitle = session[:title]
    end

    if session[:text]
      @postText = session[:text]
    end

  end

  def postimage_upload
    @postimage = PostImage.new(
      imageurl: postimage_params[:imageurl],
      user_id: current_user.id
    )
    @postimage.save

    if params[:edit]
      @id = params[:id]

      session[:edit_title] = params[:post_title]
      session[:edit_text] = params[:post_text]
      redirect_to controller: :post, action: :edit, id: @id
      
    else

      session[:title] = params[:post_title]
      session[:text] = params[:post_text]
      redirect_to('/post/new')
    end
  end

  def create

    if post_params[:commit] == "プレビュー"
      session[:preview_title] = post_params[:title]
      session[:preview_text] = post_params[:text]
      redirect_to('/preview')

    elsif post_params[:commit] == "下書き保存"
      @post = Post.new(
        title: post_params[:title], 
        text: post_params[:text], 
        user_id: current_user.id,
        draft: "true"
      )
      flash[:notice] = "下書きとして保存しました。自分のプロフィールの下書き欄を見てくださいね。"

      if session[:preview_title]
        session[:preview_title].clear
      end

      if session[:preview_text]
        session[:preview_text].clear
      end

      if session[:title]
        session[:title].clear
      end

      if session[:text]
        session[:text].clear
      end

      @post.save
      redirect_to('/profile')

    elsif post_params[:commit] == "投稿する"
      @post = Post.new(
        title: post_params[:title], 
        text: post_params[:text], 
        user_id: current_user.id,
        draft: "false"
      )
      flash[:notice] = "投稿しました！"

      if session[:preview_title]
        session[:preview_title].clear
      end

      if session[:preview_text]
        session[:preview_text].clear
      end

       if session[:title]
        session[:title].clear
      end

      if session[:text]
        session[:text].clear
      end

      @post.save
      redirect_to('/')

    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @postimages = PostImage.where(user_id: current_user.id).order(id: "DESC").first(10)
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
    @comments = Comment.where(post_id: params[:id]).all.order(id: "DESC")
    @recommend_posts = Post.where(draft: "false").order(id: "DESC").last(9)
  end

  def update
    
    if post_params[:commit] == "プレビュー"
      session[:preview_title] = post_params[:title]
      session[:preview_text] = post_params[:text]
      redirect_to('/preview')

    elsif post_params[:commit] == "下書き保存"
      @post = Post.find_by(id: params[:id])
      @post.update(
        title: post_params[:title], 
        text: post_params[:text], 
        user_id: current_user.id,
        draft: "true"
      )
      flash[:notice] = "下書きとして保存しました"

      if session[:preview_title]
        session[:preview_title].clear
      end

      if session[:preview_text]
        session[:preview_text].clear
      end

      if session[:edit_title] 
        session[:edit_title].clear
      end

      if session[:edit_text]
        session[:edit_text].clear
      end

      @post.save
      redirect_to('/')

    elsif post_params[:commit] == "投稿する"
      @post = Post.find_by(id: params[:id])
      @post.update(
        title: post_params[:title], 
        text: post_params[:text], 
        user_id: current_user.id,
        draft: "false"
      )
      flash[:notice] = "投稿しました！"

      if session[:preview_title]
        session[:preview_title].clear
      end

      if session[:preview_text]
        session[:preview_text].clear
      end

      if session[:title]
        session[:title].clear
      end

      if session[:text]
        session[:text].clear
      end

      @post.save
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
    params.permit(:title, :text, :preview, :draft, :commit)
  end

  def postimage_params
    params.permit(:imageurl)
  end

end