class User < ActiveRecord::Base
acts_as_authentic
#validates :login, :email, :first_name, :last_name, :password, :password_confirmation , :presence => true
#validates_uniqueness_of :login, :email
#validates_attachment_presence :license, :policy
validates_attachment_content_type :license, :content_type => 'application/pdf'
validates_attachment_content_type :policy, :content_type => 'application/pdf'
attr_accessor :license_file_name,:policy_file_name,:agreement_file_name

  has_attached_file :license,
   :url  => "/license/:id",
   :path => "#{Rails.root}/public/upload/license/:id/:basename.:extension"
  has_attached_file :policy,
   :url  => "/policy/:id",
   :path => "#{Rails.root}/public/upload/policy/:id/:basename.:extension"
  has_attached_file :agreement,
   :url  => "/agreement/:id",
   :path => "#{Rails.root}/public/upload/new_agreements/:id/:basename.:extension"
 def activate!
    self.active = true
    save
 end

 def activation_instructions
   reset_perishable_token!
   UserMailer.activation(self).deliver
 end

 def welcome
   reset_perishable_token!
   UserMailer.welcome(self).deliver
 end
end
