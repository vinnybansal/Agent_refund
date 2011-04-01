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

  def forgot_password(user)
   @user = user
   setup_email(user)
   @reset_password_link = "http://50.56.75.234:3000/reset_password/#{user.perishable_token}"
   end

  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "noreply@agentrefund.com"
      @subject     = "[agentrefund] - "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
