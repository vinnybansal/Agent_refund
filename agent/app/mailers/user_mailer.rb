class UserMailer < ActionMailer::Base
  default :from => "admin@agentrefund.com"
  def activation(user)
    @user = user
    setup_email(user)
    @subject    += 'Please activate your new account'
    @body[:url]  = "http://agent.com:3000/activate/#{user.perishable_token}"
  end

  def welcome(user)
    @user = user
    setup_email(user)
    @subject += "Welcome to the site!"
    @body[:url]  =  "http://agent.com:3000/"
  end

  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "noreply@binarylogic.com"
      @subject     = "[agentrefund] - "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
