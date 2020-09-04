class Admin::BasicknowleadgeController < User::ApplicationController
  protect_from_forgery 
  before_action :basic

  def url
    @basic_knowledges = BasicKnowledge.where(category_id: params[:id])
  end

  def new
    @basic_knowledge_category = BasicKnowledgeCategory.find_by(id: params[:id])
  end

  def create
    @basic_knowledge = BasicKnowledge.new(basic_knowledge_params)
    url = basic_knowledge_params[:url]
    url = url.last(11)
    @basic_knowledge.url = url
    @basic_knowledge.save
    redirect_to('/admin/basiccategory/')
  end

  def destroy
    @basic_knowledge = BasicKnowledge.find_by(id: params[:id])
    @basic_knowledge.destroy
    redirect_to('/admin/basiccategory/')
  end

  private

  def basic_knowledge_params
    params.permit(:url, :category_id)
  end


end
