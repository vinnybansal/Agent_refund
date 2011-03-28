class UsersController < ApplicationController
  require 'pdfkit'
  def new
    @user = User.new
  end
  def new_buyer
    @user = User.new
  end

  def new_seller
   @user = User.new
  end

  def show
    @user = @current_user
  end
  def create
    @user = User.new(params[:user])
    if params[:user][:user_type] == "agent"
    if @user.save
      flash[:notice] = "Registration successful."
        pdf = make_pdf @user
        redirect_to root_url
     else
        redirect_to new_user_url and return
    end
    elsif params[:user][:user_type] == "buyer"
      #do integration part
    if @user.save_without_session_maintenance
       @user.activation_instructions
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to root_url
    else
      render :action => :new
    end
   elsif params[:user][:user_type] == "seller"
      #do integration part
    if @user.save_without_session_maintenance
       @user.activation_instructions
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to root_url
    else
      render :action => :new
    end
   end
 end
 def account
   @user = current_user
 end
 def activate
   @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise  Exception)
   raise Exception if @user.active?
   if @user.activate!
     flash[:notice] = "Your account has been activated!"
     UserSession.create(@user, false) # Log user in manually
       @user.welcome
       flash[:notice] = "Account activated!"
       redirect_to root_url
     else
       render :action => :new
     end
 end
 #update confliction

 def update
    @user = current_user
    if @user.update_attributes(params[:user]) 
     @user.update_attribute(:p_completed, true)
     flash[:notice] = "Successfully updated post."
     redirect_to root_url
    end
  end
  private
  def make_pdf user
   pdf = <<EOF
    <p>I #{user.first_name} #{user.last_name} of #{user.company_name} real estate company,
    with a license number of #{user.id} located at #{user.office_address}
    agrees to pay a referral fee to Agent Refund</p>
EOF
   kit = PDFKit.new(pdf)
    dir_name = Dir.mkdir("#{Rails.root}/public/upload/agreement/#{user.id}")
    file =  File.new("#{Rails.root}/public/upload/agreement/#{user.id}/agreement.pdf","wb")
    a = kit.to_file "#{Rails.root}/public/upload/agreement/#{user.id}/agreement.pdf"
    #send_data
    return
  end
end
