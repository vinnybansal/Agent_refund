class Administrator 
  def self.find_agent page
    
    agents = UserAgent.where("block = false").where("p_completed = true").where("agent_approved = true").order("created_at DESC").paginate(:page => page, :per_page => 2)

    
  end

  def self.find_seller
    seller = User.where("user_type = 'seller'").where("block = 'false'").order("created_at DESC").all
  end

  def self.find_buyer
    buyer = User.where("user_type = 'buyer'").where("block = 'false'").order("created_at DESC").all
  end

#  def self.agent_availibility?(user)
#   return true if (user.upload_agreement == true)
#   false
#  end

  def self.make_admin(user)
    user.update_attribute(:user_type, "admin")
  end

  def self.approved(user)
    return false if user.user_type != 'agent'
    user.update_attribute(:approved, true)
  end

  def self.upload_agreement(user)
    user.update_attribute(:upload_agreement, true)
  end


  def self.report_abuse(user)
    user.update_attribute(:block, true)
  end

  def self.is_uploaded_agreement?(user)
   return true if (user.upload_agreement == true)
   false
  end

  def self.is_block?(user)
   return true if (user.block == true)
   false
  end
end
