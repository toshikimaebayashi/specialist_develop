class CreateBasicCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :basic_categories do |t|
      t.integer :category_id
      t.string :url

      t.timestamps
    end
  end
end
