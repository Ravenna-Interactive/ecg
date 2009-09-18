class AddAttachmentsPhotoToVisitor < ActiveRecord::Migration
  def self.up
    add_column :visitors, :photo_file_name, :string
    add_column :visitors, :photo_content_type, :string
    add_column :visitors, :photo_file_size, :integer
    add_column :visitors, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :visitors, :photo_file_name
    remove_column :visitors, :photo_content_type
    remove_column :visitors, :photo_file_size
    remove_column :visitors, :photo_updated_at
  end
end
