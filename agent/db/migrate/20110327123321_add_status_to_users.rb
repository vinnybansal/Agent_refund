class AddStatusToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :p_completed, :boolean, :default => 0
    add_column :users, :ag_uploaded, :boolean, :default => 0
  end

  def self.down
  end
end
