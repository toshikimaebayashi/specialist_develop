class Admin::BasicknowleadgeController < User::ApplicationController
  protect_from_forgery 
  before_action :basic

  def url
    @basic_knowledge = BasicKnowledge.where(category_id: params[:id])

    @basic_knowledges = @basic_knowledge.sort_by { |a| a[:ranking] } .reverse
    @category_id = params[:id]
  end

  def new
    @basic_knowledge_category = BasicKnowledgeCategory.find_by(id: params[:id])
  end

  def ranking_create
    @basic_knowledge = BasicKnowledge.find_by(id: params[:knowledge_id])
    @basic_knowledge.update(
      ranking: basic_knowledge_ranking_params[:ranking], 
    )
    @basic_knowledge.save

    redirect_to "/admin/basicknowleadge/#{params[:id]}/url" 
  end

  def create
    @basic_knowledge = BasicKnowledge.new(
      ranking: 0,
      url: basic_knowledge_params[:url],
      category_id: basic_knowledge_params[:category_id]
    )
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

  def basic_knowledge_ranking_params
    params.permit(:ranking)
  end


end
