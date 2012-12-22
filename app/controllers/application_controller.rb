#encoding: utf-8
class ApplicationController < ActionController::Base
  	
  	protect_from_forgery
  	include SessionsHelper

  	private
	    def require_authentication
      store_location
			redirect_to signin_url unless signed_in?
	    end

		def private_access
      		@user = User.find params[:id]
      		redirect_to(signin_path) unless current_user? @user
    	end
end
