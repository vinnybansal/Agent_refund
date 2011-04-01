class PolymorphicPaperclipMigration < ActiveRecord::Migration
  def self.up
    create_table "assets" do |t|
      t.string :license_file_name
      t.string :license_content_type
      t.integer :license_file_size
      t.datetime :license_updated_at
      t.string :policy_file_name
      t.string :policy_content_type
      t.integer :policy_file_size
      t.datetime :policy_updated_at
      t.string :agreement_file_name
      t.string :agreement_content_type
      t.integer :agreement_file_size
      t.datetime :agreement_updated_at
      t.integer  "attachings_count", :default => 0
      t.datetime "created_at"
      t.datetime "data_updated_at"
    end

    create_table "attachings" do |t|
      t.string  "from_url"
      t.integer  "attachable_id"
      t.integer  "asset_id"
      t.string   "attachable_type"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "attachings", ["asset_id"], :name => "index_attachings_on_asset_id"
    add_index "attachings", ["attachable_id"], :name => "index_attachings_on_attachable_id"
  end

  def self.down
    drop_table :assets
    drop_table :attachings
  end
end