class AddAgreementUploadToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :agreement_file_name, :string
    add_column :users, :agreement_content_type, :string
    add_column :users, :agreement_file_size, :integer
    add_column :users, :agreement_updated_at, :datetime
  end

  def self.down
    remove_column :users, :agreement_file_name
    remove_column :users, :agreement_content_type
    remove_column :users, :agreement_file_size
    remove_column :users, :agreement_updated_at
  end
end
