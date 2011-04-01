class UserSessionsController < ApplicationController
 
 
  before_filter :require_user, :only => :destroy
  before_filter :require_no_user, :only => [:new, :create, :forgot_password, :forgot_password_lookup_email]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default root_url
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
  def forgot_password
 if current_user
   redirect_to edit_account_url
 else
   @user_session = UserSession.new()
   end
 end

 def forgot_password_lookup_email
   if current_user
     redirect_to edit_account_url
   else
     user = User.find_by_email(params[:user_session][:login])
     if user
       user.send_forgot_password!
       flash[:notice] = "A link to reset your password has been mailed to you."
     else
       flash[:notice] = "Email #{params[:user_session][:email]} wasn't found.  Perhaps you used a different one?  Or never registered or something?"
       render :action => :forgot_password
     end
   end
 end
end
