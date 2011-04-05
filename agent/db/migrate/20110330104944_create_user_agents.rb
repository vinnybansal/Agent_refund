class CreateUserAgents < ActiveRecord::Migration
  def self.up
    create_table :user_agents do |t|
      t.belongs_to :user, :null => false
      t.datetime  :start_year
      t.integer :home_sold_last_year
      t.string  :top_cities
      t.integer :home_sold_lifetime
      t.text    :client_details
      t.string  :designation
      t.datetime :license_expiration_date
      t.datetime  :eo_policy_expiration_date
      t.string  :violation
      t.string  :know_about_us
      t.timestamps
    end
  end

  def self.down
    drop_table :user_agents
  end
end
