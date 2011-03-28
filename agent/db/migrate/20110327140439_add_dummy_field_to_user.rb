class AddDummyFieldToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :field1, :string
    add_column :users, :field2, :string
    add_column :users, :field3, :string
    add_column :users, :field4, :string
  end

  def self.down
    remove_column :users, :field1
    remove_column :users, :field2
    remove_column :users, :field3
    remove_column :users, :field4
  end
end
