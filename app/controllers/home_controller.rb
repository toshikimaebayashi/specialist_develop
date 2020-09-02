class HomeController < User::ApplicationController
  
  def top
    @posts = Post.where(draft: "false")
  end

  
end
