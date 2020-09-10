class HomeController < User::ApplicationController
  
  def top
    @posts = Post.where(draft: "false").order(id: "DESC").page(params[:page])
  end

  def no
  end

end
