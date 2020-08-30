class BasicKnowledgeCategory < ApplicationRecord
  def basic_knowledge
    return BasicKnowledge.find_by(category_id: self.id)
  end
end
