class Admin::BasiccategoryController < User::ApplicationController
  protect_from_forgery 
  before_action :basic

  def index
    @basic_knowledge_categories = BasicKnowledgeCategory.all.order(:id)
  end

  def new
  end

  def create
    @basic_knowledge_category = BasicKnowledgeCategory.new(basic_knowledge_category_params)
    @basic_knowledge_category.save
    redirect_to('/admin/basiccategory/')
  end

  def edit
    @basic_knowledge_category = BasicKnowledgeCategory.find_by(id: params[:id])
  end

  def show
    redirect_to('/admin/basiccategory/')
  end

  def update
    @basic_knowledge_category = BasicKnowledgeCategory.find_by(id: params[:id]).update(basic_knowledge_category_params)
    redirect_to('/admin/basiccategory/')
  end

  def destroy
    @basic_knowledge_category = BasicKnowledgeCategory.find_by(id: params[:id])
    @basic_knowledge_category.destroy
    redirect_to('/admin/basiccategory/')
  end


  private

  def basic_knowledge_category_params
    params.permit(:name, :id)
  end


end
