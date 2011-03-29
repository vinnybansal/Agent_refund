class AddBlockBooleanToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :block, :boolean, :default => false
    add_column :users, :agent_approved, :boolean, :default => false
    add_column :users, :upload_agreement, :boolean, :default => false
  end

  def self.down
  end
end
