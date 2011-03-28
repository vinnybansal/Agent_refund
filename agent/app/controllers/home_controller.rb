class HomeController < ApplicationController
  before_filter :require_user
  before_filter :require_profile_completeness, :except => [:uncompleted]
  def index
    @user = current_user
  end
  def uncompleted
    @person = current_user
  end
  def download
    @user = current_user
    send_file "#{Rails.root}/public/upload/agreement/#{@user.id}/agreement.pdf", :type=>"application/pdf"
    #redirect_to root_path
  end
  

end
