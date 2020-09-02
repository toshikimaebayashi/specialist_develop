class RemoveColumPost < ActiveRecord::Migration[5.2]
  def up
    remove_column :posts, :status
  end

  def down
    add_column :posts, :draft, :string
  end
end
