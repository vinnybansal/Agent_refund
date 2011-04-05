class AddActiveFieldToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :active,:boolean, :default => false, :null => false
    u1 = User.create!(:login=>"admin", :email=>"yogendra8singh@gmail.com", :password=>"fstech", :password_confirmation=>"fstech", :first_name=>"yogendra", :last_name=>"admin",
    :user_type => "admin",:active => true, :zip => "12345" )
    u1.save!
  end

  def self.down
    remove_column :users, :active
  end
end      
