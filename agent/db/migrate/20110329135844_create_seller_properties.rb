class CreateSellerProperties < ActiveRecord::Migration
  def self.up
    create_table :seller_properties do |t|
      t.integer :user_id
      t.string :type_of_property
      t.string :estimated_price
      t.string :property_zip_code
      t.string :property_use
      t.string :street_adress
      t.string :property_city
      t.string :property_state
      t.string :phonenumber

      t.timestamps
    end
  end

  def self.down
    drop_table :seller_properties
  end
end
