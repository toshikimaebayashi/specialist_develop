class BasicController < User::ApplicationController
  protect_from_forgery 
  
  def top
    @basic_knowledge_categories = BasicKnowledgeCategory.all
  end

  def movie
    @basic_knowledge = BasicKnowledge.where(category_id: params[:id])
    @basic_knowledges = @basic_knowledge.sort_by { |a| a[:ranking] } .reverse

    

    @basic_knowledge_category = BasicKnowledgeCategory.find_by(id: params[:id])
  end

end
