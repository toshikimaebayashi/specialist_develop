class BasicController < User::ApplicationController
  protect_from_forgery 
  
  def top
    @basic_knowledge_categories = BasicKnowledgeCategory.all
  end

  def movie
    @basic_knowledges = BasicKnowledge.where(category_id: params[:id])
    @basic_knowledge_category = BasicKnowledgeCategory.find_by(id: params[:id])
  end

end
