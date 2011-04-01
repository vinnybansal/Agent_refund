class HomeController < ApplicationController
  before_filter :require_user
  #before_filter :require_profile_completeness, :except => [:uncompleted]
  def index
    @user = current_user
  end
  def uncompleted
    @person = current_user
    @select_values = "Client,Agent,Friend,Facebook,Twitter,Agent Refund reached out to me,surfing the web,other"
    @check_values = "ABR, ABRM, ALC, ALHS , CCIM, CDPE, CIPS , CLHMS, CPM, CRB, CRS, CRE, e-PRO, GAA, GRI, Green, PMN, RCE, RAA, RRG, SFR, SRES, SIOR"
    @user_agent = current_user.user_agent
    @country = Country.where("name = 'United States'")
    @states = State.where("country_id = #{@country.first.id}")
  end
  def download
    @user = current_user
    send_file "#{Rails.root}/public/upload/agreement/#{@user.id}/agreement.pdf", :type=>"application/pdf"
    #redirect_to root_path
  end
  def upload_agreement
    @person = current_user
  end
  def welcome
    
  end
  def user_profile
    @user = current_user
    @user_agent = @user.user_agent

  end
  

end
