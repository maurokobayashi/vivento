class ApplicationController < ActionController::Base
  	
  	protect_from_forgery
  	include SessionsHelper

  	private
	    def require_authentication
			redirect_to signin_url unless signed_in?
	    end
end
