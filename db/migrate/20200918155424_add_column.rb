class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :basic_knowledge_categories, :knowledge_category_id, :integer
  end
end
