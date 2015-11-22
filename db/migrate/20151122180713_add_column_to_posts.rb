class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :longditude, :float
    add_column :posts, :latitude, :float
  end
end
