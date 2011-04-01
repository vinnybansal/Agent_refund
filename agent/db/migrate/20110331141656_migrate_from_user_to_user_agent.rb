class MigrateFromUserToUserAgent < ActiveRecord::Migration
  def self.up
    remove_column :users, :company_name
    remove_column :users, :broker_name
    remove_column :users, :office_address
    add_column    :user_agents, :company_name, :string
    add_column    :user_agents, :broker_name , :string
    add_column    :user_agents, :address1, :string
    add_column    :user_agents, :address2, :string
  end

  def self.down
    add_column    :users, :company_name, :string
    add_column    :users, :broker_name , :string
    add_column    :users, :office_address, :string
    remove_column :user_agents, :company_name
    remove_column :user_agents, :broker_name
    remove_column :user_agents, :address1
    remove_column :user_agents, :address2


  end
end
