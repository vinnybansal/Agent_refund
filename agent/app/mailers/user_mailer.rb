class UserMailer < ActionMailer::Base
  default :from => "admin@agentrefund.com"
  def activation(user)
    @user = user
    setup_email(user)
    @subject    += 'Please activate your new account'
    @body[:url]  = "http://50.56.75.234:3000/activate/#{user.perishable_token}"
  end

  def welcome(user)
    @user = user
    setup_email(user)
    @subject += "Welcome to the site!"
    @body[:url]  =  "http://50.56.75.234:3000/"
  end
  def  past_client_notification(email,agent,token)
    setup_reciever(email)
    @subject += "Requested your review"
    @body[:agent_name] = "#{agent.first_name} #{agent.last_name}"
    @body[:url] = "http://50.56.75.234:3000/#{agent.login}/reviews/#{token}"
  end
  def peer_notification(email,agent,token)
    setup_reciever(email)
    @subject += "Requested your review"
    @body[:agent_name] = "#{agent.first_name} #{agent.last_name}"
    @body[:url] = "http://50.56.75.234:3000/#{agent.login}/reviews/#{token}"
  end
  

  def forgot_password(user)
   @user = user
   setup_email(user)
   @reset_password_link = "http://50.56.75.234:3000/reset_password/#{user.perishable_token}"
   end

  protected
    def setup_reciever(email)
      @recipients = "#{email}"
      @from = "noreply@agentrefund.com"
      @subject = "[agentrefund]"
      @sent_on = Time.now
    end
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "noreply@agentrefund.com"
      @subject     = "[agentrefund] - "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
