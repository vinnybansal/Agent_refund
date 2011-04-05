class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
        t.references :country, :null => false
        t.references :state, :null => false
        t.string :name, :limit => 45, :null => false
        t.float :latitude, :null => false
        t.float :longitude, :null => false
        t.string :timezone, :limit => 10, :null => false
        t.integer :dma_id
        t.string :county, :limit => 25
        t.string :code, :limit => 4
        t.timestamps
      end
      add_index :cities, :name
  end

  def self.down
    drop_table :cities
  end
end
