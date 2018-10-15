# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  helper_method :current_user
  before_filter :set_current_user
  protected
def set_current_user
     Authorization.current_user = current_user if session[:user_id].present?
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  
end

