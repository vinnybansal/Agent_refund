class HomeController < ApplicationController
  before_filter :require_user, :except => :write_review
  before_filter :require_agent, :only => :send_request
  #before_filter :require_profile_completeness, :except => [:uncompleted]
  def index
    @user = current_user
    redirect_to  user_seller_properties_path(@user) if @user.user_type == 'seller'
  end
  def uncompleted
    @person = current_user
    @select_values = "Client,Agent,Friend,Facebook,Twitter,Agent Refund reached out to me,surfing the web,other"
    @check_values = "ABR, ABRM, ALC, ALHS , CCIM, CDPE, CIPS , CLHMS, CPM, CRB, CRS, CRE, e-PRO, GAA, GRI, Green, PMN, RCE, RAA, RRG, SFR, SRES, SIOR"
    @user_agent = current_user.user_agent
    @country = Country.where("name = 'United States'")
    @states = State.where("country_id = #{@country.first.id}")
    @user_comment = @person.comments.new
  end
  def download
    @user = current_user
    send_file "#{Rails.root}/public/upload/agreement/#{@user.id}/agreement.pdf", :type=>"application/pdf"
    #redirect_to root_path
  end
  def upload_agreement
    @person = current_user.user_agent
  end
  def welcome
    
  end
  def find_review
    @user = User.find(params[:user_id])
    @comments = @user.comments.where("review_type = '#{params[:review_type]}'")
    render :partial => "/comments/reviews", :locals => { :comments => @comments }, :layout => false
  end
  
  def find_agent
    @agents = Administrator.find_agent params[:page]
  end
  def user_profile
    @user = current_user
    @user_agent = @user.user_agent
    @user_comment = current_user.comments.new 
  end
  def write_review
        redirect_to root_url if params[:id].blank?
        @user = User.find_by_login(params[:id])
  end
  def send_request
    
  end
  def send_notification
    @email = params[:email]
    @agent = current_user unless current_user.blank?
    if params[:agent] == "client"
    UserMailer.past_client_notification(@email,@agent).deliver
  elsif params[:agent] == "peer"
    UserMailer.peer_notification(@email,@agent).deliver
    end
    flash[:notice] = "Mail sent successfully to the client"
    redirect_to root_url
  end

end
