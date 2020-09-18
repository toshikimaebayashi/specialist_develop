class Addranking < ActiveRecord::Migration[5.2]
  def change
    add_column :basic_knowledges, :ranking, :integer
  end
end
