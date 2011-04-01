class UserAgentsController < ApplicationController
  
  def create
    puts params.inspect
    @user_agent = current_user.build_user_agent(params[:user_agent])
    @user_agent.designation = params[:user_agent][:designation].join(',')
    @user_agent.save
    flash[:notice] = "successful"
    redirect_to root_path
  end
  def update
    puts params.inspect
    puts "update params here =============================="
    @country = Country.where("name = 'United States'")
    @states = State.where("country_id = #{@country.first.id}")
     @select_values = "Client,Agent,Friend,Facebook,Twitter,Agent Refund reached out to me,surfing the web,other"
    @check_values = "ABR, ABRM, ALC, ALHS , CCIM, CDPE, CIPS , CLHMS, CPM, CRB, CRS, CRE, e-PRO, GAA, GRI, Green, PMN, RCE, RAA, RRG, SFR, SRES, SIOR"
    puts "inside update fist line"
    @user = current_user
    @user.update_attributes(params[:user])
   puts "inside update secondline line"
    if @user.user_type == "agent"
      @user_agent = UserAgent.find(params[:user_agent][:id])
      if @user_agent.update_attributes(params[:user_agent])
        @user_agent.update_attribute(:designation, params[:user_agent][:designation].join(',')) unless params[:user_agent][:designation].blank?
        @user_agent.update_attribute(:p_completed, true)
        flash[:notice] = "Successfully uploaded"
        redirect_to root_path
      else
        flash[:notice] = "Error occured"
        render :action => 'home/uncompleted'
      end
    end
      puts "outside loop"
    #redirect_to root_path unless @user.user_type == "agent"
  end
  
  def edit
      @user_agent = current_user.user_agent
  end
  
end
    
    


    