class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user_session, :current_user, :require_profile_completeness, :is_agent, :user_is_agent, :require_agent
  
  def is_agent
    return true if current_user.user_type == "agent"
  end
  def user_is_agent user
    return true if user.user_type == "agent"
  end

  private
    def require_profile_completeness
      if !current_user.user_agent.p_completed
        redirect_to uncompleted_path
        return false
      end
    end
    def current_user_session
      logger.debug "ApplicationController::current_user_session"
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      logger.debug "ApplicationController::current_user"
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
      
    end

    def require_user
      logger.debug "ApplicationController::require_user"
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end
    def require_agent
      unless current_user.user_type == "agent"
        store_location
        flash[:notice] = "You have to be agent to do this operation"
        redirect_to root_path
        return false
      end
    end

    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_path
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
