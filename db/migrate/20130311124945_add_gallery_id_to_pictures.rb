class AddGalleryIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :gallery_id, :int
  end
end
