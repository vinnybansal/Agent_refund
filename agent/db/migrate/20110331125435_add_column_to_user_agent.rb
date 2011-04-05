class AddColumnToUserAgent < ActiveRecord::Migration
  def self.up
    add_column :user_agents, :license_file_name,    :string
    add_column :user_agents, :license_content_type, :string
    add_column :user_agents, :license_file_size,    :integer
    add_column :user_agents, :license_updated_at,   :datetime
    add_column :user_agents, :policy_file_name,     :string
    add_column :user_agents, :policy_content_type,  :string
    add_column :user_agents, :policy_file_size,     :integer
    add_column :user_agents, :policy_updated_at,    :datetime
    add_column :user_agents, :agreement_file_name,  :string
    add_column :user_agents, :agreement_content_type, :string
    add_column :user_agents, :agreement_file_size,  :string
    add_column :user_agents, :agreement_updated_at,  :string
    
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

  def self.down
	remove_column :user_agents, :license_file_name
    remove_column :user_agents, :license_content_type
    remove_column :user_agents, :license_file_size
    remove_column :user_agents, :license_updated_at
    remove_column :user_agents, :policy_file_name
    remove_column :user_agents, :policy_content_type
    remove_column :user_agents, :policy_file_size
    remove_column :user_agents, :policy_updated_at
    remove_column :user_agents, :agreement_file_name
    remove_column :user_agents, :agreement_content_type
    remove_column :user_agents, :agreement_file_size
    remove_column :user_agents, :agreement_updated_at
    
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
end
