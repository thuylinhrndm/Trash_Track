class ChangeColumnNamesInPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :latitude, :lat
  	rename_column :posts, :longditude, :lon
  end
end
