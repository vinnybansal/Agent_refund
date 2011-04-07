class AddToSellerProperty < ActiveRecord::Migration
  def self.up
    add_column :seller_properties, :property_discription, :text
  end

  def self.down
  remove_column :seller_properties, :property_discription
  end
end
