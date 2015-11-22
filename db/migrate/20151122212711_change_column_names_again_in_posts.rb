class ChangeColumnNamesAgainInPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :lat, :latitude
  	rename_column :posts, :lon, :longitude
  end
end
