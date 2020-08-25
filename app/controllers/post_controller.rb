class PostController < ApplicationController

  def top
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to('/')
  end

  def edit
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.permit(:title, :text)
  end

end