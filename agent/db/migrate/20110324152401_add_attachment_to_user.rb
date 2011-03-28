class AddAttachmentToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :license_file_name,    :string
    add_column :users, :license_content_type, :string
    add_column :users, :license_file_size,    :integer
    add_column :users, :license_updated_at,   :datetime
    add_column :users, :policy_file_name,     :string
    add_column :users, :policy_content_type,  :string
    add_column :users, :policy_file_size,     :integer
    add_column :users, :policy_updated_at,    :datetime
    add_column :users, :agreement_file_name,  :string
    add_column :users, :agreement_content_type, :string
    add_column :users, :agreement_file_size,  :string
    add_column :users, :agreement_updated_at,  :string
  end

  def self.down
    remove_column :users, :license_file_name
    remove_column :users, :license_content_type
    remove_column :users, :license_file_size
    remove_column :users, :license_updated_at
    remove_column :users, :policy_file_name
    remove_column :users, :policy_content_type
    remove_column :users, :policy_file_size
    remove_column :users, :policy_updated_at
    remove_column :users, :agreement_file_name
    remove_column :users, :agreement_content_type
    remove_column :users, :agreement_file_size
    remove_column :users, :agreement_updated_at
  end
end
