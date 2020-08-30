class BasicKnowledge < ApplicationRecord
  def basic_category
    return BasicKnowledgeCategory.find_by(id: self.category_id)
  end
end
