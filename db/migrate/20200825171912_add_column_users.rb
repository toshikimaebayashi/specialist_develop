class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :iconimageurl, :string
    add_column :users, :coverimageurl, :string
    add_column :users, :profile, :string
    add_column :users, :selfideal, :string
  end
end
