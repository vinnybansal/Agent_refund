class SellerProperty < ActiveRecord::Base
acts_as_rateable
belongs_to :user
has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url  => "/sellerproperties/images/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/sellerproperties/images/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
validates_numericality_of :property_zip_code, :phonenumber,:estimated_price
validates :property_zip_code, :length => { :minimum => 5 }
validates :phonenumber, :length => { :minimum => 10 }
validates :type_of_property,:property_use,:street_adress,:property_city,:property_state, :presence => true
end
