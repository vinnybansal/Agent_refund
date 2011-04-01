class MigrateAddressFromUserAgentToUsers < ActiveRecord::Migration
  def self.up
    remove_column :user_agents, :address1
    remove_column :user_agents, :address2
    add_column  :users, :address1, :string
    add_column  :users, :address2, :string
  end

  def self.down
    add_column :user_agents, :address1, :string
    add_column :user_agents, :address2, :string
    remove_column  :users, :address1
    remove_column  :users, :address2
  end
end
