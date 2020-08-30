class Api::PostsController < ApplicationController
  def preview
    @html = view_context.markdown(params[:text])
  end
end