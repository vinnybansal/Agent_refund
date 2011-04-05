class AddReviewTypeToComments < ActiveRecord::Migration
  def self.up
    add_column :comments , :review_type, :string
  end

  def self.down
    remove_column :comments, :review_type
  end
end
