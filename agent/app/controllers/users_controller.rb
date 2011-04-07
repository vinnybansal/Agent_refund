class UsersController < ApplicationController
  require 'pdfkit'
 
  def new
    @user = User.new
    @user.user_agent = UserAgent.new
    @country = Country.where("name = 'United States'")
    @states = State.where("country_id = #{@country.first.id}")
  end

  def new_buyer
    @user = User.new
  end

  def new_seller
   @user = User.new
  end

  #def show
   # @user = @current_user
  #end
  def create
    @user = User.new(params[:user])
    @country = Country.where("name = 'United States'")
    @states = State.where("country_id = #{@country.first.id}")
    if params[:user][:user_type] == "agent"
    params[:user_agent][:agent_approved] = true
    @user.build_user_agent(params[:user_agent])
    if @user.save
         #@user.build_user_agent.save
         pdf = make_pdf @user
         @user.update_attribute(:active, true)
         flash[:notice] = "Your account has been successfully created."
        redirect_to root_url
     else
        render :action => :new
    end
    elsif params[:user][:user_type] == "buyer"
      #do integration part
    if @user.save
       #@user.activation_instructions
       @user.update_attribute(:active, true)
       flash[:notice] = "Your account has been successfully created."
       redirect_to root_url
    else
      render :action => :new_buyer
    end
   elsif params[:user][:user_type] == "seller"
      #do integration part
    if @user.save
       #@user.activation_instructions
       @user.update_attribute(:active, true)
      flash[:notice] = "Your account has been successfully created."
      redirect_to  user_seller_properties_path(@user)
    else
      render :action => :new_seller
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
 def show
   @user = User.find_by_login(params[:id])
   @user_agent = @user.user_agent unless @user.user_agent.nil?
   @comment = @user.comments.new
   @comments = @user.comments
 end
 def create_comment
   puts "create comment params--------------------------."
   puts params[:temp]
   @user = User.find(params[:user])
   @user_agent = @user.user_agent 
   @comment = @user.comments.create(params[:comment])
   @comment.user_id = current_user.id unless current_user.blank?
   if @comment.save
     unless params[:temp].blank?
     flash[:notice] = "Thanks, Added your Review successfully "
     else
     flash[:notice] = "Review Added"
     end
   end
    #   redirect_to root_url if params[:temp]
 end
 #update confliction
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes!(params[:user])
     @user.user_agent.update_attribute(:p_completed, true) if params[:complete_profile]
     #@user.user_agent.update_attribute(:ag_uploaded, true) if params[:hifield]
     #flash[:notice] = "Successfully uploaded the agreement."  if  params[:hifield]
     flash[:notice] = "Successfully completed the profile." if params[:complete_profile]
     redirect_to welcome_path
    else
     flash[:notice] = "Error occured"
     redirect_to :controller => :home,:action => :uncompleted
    end
  end
  def reset_password
   @user = User.find_using_perishable_token(params[:reset_password_code], 1.week) || (raise Exception)
 end

 def reset_password_submit
   @user = User.find_using_perishable_token(params[:reset_password_code], 1.week) || (raise Exception)
   @user.active = true
   if @user.update_attributes(params[:user].merge({:active => true}))
     flash[:notice] = "Successfully reset password."
     redirect_to root_url
   else
     flash[:notice] = "There was a problem resetting your password."
     render :action => :reset_password
   end 
 end
 
  
  private
  
    def make_pdf user
    pdf = <<EOF
    <p>I #{user.first_name} #{user.last_name} of #{user.user_agent.company_name} real estate company,
    with a license number of #{user.id} located at #{user.address1} #{user.address2}
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
