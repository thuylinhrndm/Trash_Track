class AddColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :rating, :integer
    add_column :posts, :image_path, :string
  end
end
