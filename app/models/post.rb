class Post < ActiveRecord::Base
	belongs_to :user

	mount_uploader :image_path, ImageUploader
	validates :user_id, presence: true
	
	geocoded_by :address
	after_validation :geocode

end
