class Post < ActiveRecord::Base
	belongs_to :user

	mount_uploader :image_path, ImageUploader
	validates :user_id, presence: true
	

	

end
