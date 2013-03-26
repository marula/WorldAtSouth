class RemoveUrlFromPictures < ActiveRecord::Migration
  def up
    remove_column :pictures, :url
  end

  def down
    add_column :pictures, :url, :string
  end
end
