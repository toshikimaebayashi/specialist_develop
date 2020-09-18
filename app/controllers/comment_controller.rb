class CommentController < User::ApplicationController
  
  def create
    @comment = Comment.new(
      body: comment_params[:body], 
      user_id: current_user.id,
      post_id: params[:id], 
    )
    flash[:notice] = "コメントを送信しました"

    @comment.save
    redirect_to "/post/#{params[:id]}"
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to('')
  end

  private
  def comment_params
    params.permit(:body)
  end

end
