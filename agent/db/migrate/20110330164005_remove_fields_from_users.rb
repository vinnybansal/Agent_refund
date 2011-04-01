class RemoveFieldsFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :p_completed
    remove_column :users, :ag_uploaded
    remove_column :users, :agent_approved
    remove_column :users, :block
    remove_column :users, :upload_agreement
    add_column  :user_agents, :p_completed, :boolean, :default => false
    add_column  :user_agents, :ag_uploaded, :boolean, :default => false
    add_column  :user_agents, :agent_approved, :boolean, :default => false
    add_column  :user_agents, :block, :boolean, :default => false
    add_column  :user_agents, :upload_agreement, :boolean, :default => false
  end

  def self.down
    add_column  :users, :p_completed, :boolean, :default => false
    add_column  :users, :ag_uploaded, :boolean, :default => false
    add_column  :users, :agent_approved, :boolean, :default => false
    add_column  :users, :block, :boolean, :default => false
    add_column  :users, :upload_agreement, :boolean, :default => false
    remove_column :user_agents, :p_completed
    remove_column :user_agents, :ag_uploaded
    remove_column :user_agents, :agent_approved
    remove_column  :user_agents, :block, :boolean, :default => false
    remove_column :user_agents, :upload_agreement
  end
end
