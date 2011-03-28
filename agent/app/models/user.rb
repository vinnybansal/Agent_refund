class User < ActiveRecord::Base
acts_as_authentic
attr_accessor :license_file_name,:policy_file_name,:agreement_file_name

  has_attached_file :license,
   :url  => "/license/:id",
   :path => "#{Rails.root}/public/upload/license/:id/:basename.:extension"
  has_attached_file :policy,
   :url  => "/policy/:id",
   :path => "#{Rails.root}/public/upload/policy/:id/:basename.:extension"
  #  has_attached_file :agreement,
  #   :url  => "/agreement/:id",
  #   :path => "#{Rails.root}/public/upload/agreement/:id/:basename.:extension"
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
