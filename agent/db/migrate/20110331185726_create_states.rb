class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.references :country, :null => false
      t.string :name, :limit => 45, :null => false
      t.string :code, :limit => 8, :null => false
      t.string :adm1code, :limit => 4, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :states
  end
end
