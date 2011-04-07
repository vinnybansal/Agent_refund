class User < ActiveRecord::Base
has_many :seller_properties,:include=>:user, :conditions=>["users.user_type=?","seller"]
has_many :notifications
#, :include => :user, :conditions => ["users.user_type=?", "agent"]
acts_as_authentic
acts_as_commentable
has_one :user_agent, :dependent => :destroy
validates :user_agent, :presence => true , :if => :user_is_agent
validates_associated :user_agent, :if => :user_is_agent, :message => "You have to submit license and policy in pdf format"
validates :login,:email,:first_name, :last_name, :presence => true
validates_uniqueness_of :email
validates_numericality_of :zip, :allow_nil => true
validates :property_price, :presence => true, :if => :user_is_seller
validates_numericality_of :property_price, :if => :user_is_seller
validates :property_type,:presence => true, :if => :user_is_buyer
validates_numericality_of :price, :if => :user_is_buyer
validates_acceptance_of :terms_service
validates_acceptance_of :privacy_policy 

  
 
 def activate!
    self.active = true
    save
 end

def user_is_agent
  user_type == "agent"
end

def user_is_seller
  user_type == "seller"
end

def user_is_buyer
  user_type == "buyer"
end

def user_is_admin
  user_type == "admin"
end

 def activation_instructions
   reset_perishable_token!
   UserMailer.activation(self).deliver
 end

 def welcome
   reset_perishable_token!
   UserMailer.welcome(self).deliver
 end
def send_notification_to
  UserMailer.past_client_notification(client).deliver
end

 def active?
 active
 end


 def deactivate!
   self.active = false
   save
 end

 def is_admin?
   return true if self.user_type == "admin"
   return false
 end

def send_forgot_password!
   deactivate!
   reset_perishable_token!
   UserMailer.forgot_password(self).deliver
 end
 
end
