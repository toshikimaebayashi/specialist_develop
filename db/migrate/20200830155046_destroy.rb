class Destroy < ActiveRecord::Migration[5.2]
  def change
    drop_table :basic_categories
  end
end
