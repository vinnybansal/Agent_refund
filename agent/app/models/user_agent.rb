class UserAgent < ActiveRecord::Base
  belongs_to :user
  #attr_accessor :license_file_name
  acts_as_polymorphic_paperclip
  #validates :home_sold_last_year, :client_details, :violation ,:presence => true, :on => :update, :if => :hifield
  #attr_accessor :nested
  validates_attachment_presence :policy, :on => :create
  validates_attachment_presence :license, :on => :create
  validates_attachment_content_type :license, :content_type => 'application/pdf'
  validates_attachment_content_type :policy, :content_type => 'application/pdf'
#def hifield
 # unless params[:hifield].blank?
#end
  has_attached_file :license,
   :content_type => ['application/pdf', 'application/msword', 'text/plain'],
   :url  => "/license/:id",
   :path => "#{Rails.root}/public/upload/license/:id/:basename.:extension"
  has_attached_file :policy,
  :content_type => ['application/pdf', 'application/msword', 'text/plain'],
   :url  => "/policy/:id",
   :path => "#{Rails.root}/public/upload/policy/:id/:basename.:extension"
  has_attached_file :agreement,
   :url  => "/agreement/:id",
   :path => "#{Rails.root}/public/upload/new_agreements/:id/:basename.:extension"
 
end
