class RemoveAgreementFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :agreement_file_name
    remove_column :users, :agreement_file_size
    remove_column :users, :agreement_content_type
    remove_column :users, :agreement_updated_at
  end

  def self.down
    add_column  :users, :agreement_file_name, :string
    add_column  :users, :agreement_file_size, :string
    add_column  :users, :agreement_content_type, :string
    add_column  :users, :agreement_updated_at, :datetime
  end
end
