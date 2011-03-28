class AddPropertyTypeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :property_type, :string
    add_column :users, :price, :string
  end

  def self.down
    remove_column :users, :property_type
    remove_column :users, :price
  end
end
