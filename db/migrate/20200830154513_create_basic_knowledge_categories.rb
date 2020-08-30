class CreateBasicKnowledgeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :basic_knowledge_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
