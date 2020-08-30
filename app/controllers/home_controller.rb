class HomeController < User::ApplicationController
  
  def top
    @posts = Post.all
  end

  
end
