class AddColumPost1 < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :draft, :string
  end
end
