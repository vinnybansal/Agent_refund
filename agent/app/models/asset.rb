class Asset < ActiveRecord::Base
	#has_attached_file :asset
  has_many :attachings, :dependent => :destroy
  has_attached_file :license,
   :url  => "/license/:id",
   :path => "#{Rails.root}/public/upload/license/:id/:basename.:extension"
  has_attached_file :policy,
   :url  => "/policy/:id",
   :path => "#{Rails.root}/public/upload/policy/:id/:basename.:extension"
  has_attached_file :agreement,
   :url  => "/agreement/:id",
   :path => "#{Rails.root}/public/upload/new_agreements/:id/:basename.:extension"
end
