class AddPhotoToSellerProperty < ActiveRecord::Migration
  def self.up
    add_column :seller_properties, :photo_file_name, :string
    add_column :seller_properties, :photo_content_type, :string
    add_column :seller_properties, :photo_file_size, :integer
  end

  def self.down
    remove_column :seller_properties, :photo_file_size
    remove_column :seller_properties, :photo_content_type
    remove_column :seller_properties, :photo_file_name
  end
end
