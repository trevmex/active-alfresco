# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  #
  # include user authentication
  #
  include AuthenticatedSystem
  
  #
  # require_auth:  
  # True: turn on User Authentication
  # False: turn off User Authentication
  #
  @require_auth = false

  if @require_auth == true
    #
    # Make login required to view ALL pages
    #
    before_filter :login_required
  end

  #
  # Scrub sensitive parameters from your log
  #
  filter_parameter_logging :password
end