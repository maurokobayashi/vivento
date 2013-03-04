#encoding: utf-8
class ApplicationController < ActionController::Base

    include SessionsHelper
    include FacebookHelper

    protect_from_forgery

    private
        def require_authentication
            store_location
            redirect_to sign_in_url unless signed_in?
        end

        def require_admin
            redirect_to current_user unless current_user.admin?
        end

        def require_private
            @user = User.find params[:id]
            redirect_to current_user unless current_user? @user
        end

        def require_admin_or_private
            @user = User.find params[:id]
            redirect_to current_user unless current_user.admin? || current_user?(@user)
        end

end
