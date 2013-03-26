class Picture < ActiveRecord::Base
  belongs_to :gallery
  attr_accessible :name, :image, :remote_image_url, :gallery_id

  validates_presence_of :name 
  validates_presence_of :gallery_id 
  validates_uniqueness_of :name

  mount_uploader :image, ImageUploader
end
