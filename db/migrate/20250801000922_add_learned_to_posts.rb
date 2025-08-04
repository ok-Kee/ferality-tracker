class AddLearnedToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :learned, :text
  end
end
