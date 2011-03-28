class AddSellerToUser < ActiveRecord::Migration
  def self.up
  add_column :users, :property_address, :text
  add_column :users, :property_price, :string
  add_column :users, :reason_for_selling, :text
  end

  def self.down
  remove_column :users, :property_address
  remove_column :users, :property_price
  remove_column :users, :reason_for_selling
  end
end
