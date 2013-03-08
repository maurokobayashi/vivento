#encoding: utf-8
class SessionsController < ApplicationController

	def new
		render :layout => 'static'
  	end

  	def create_with_fb
	    fb_account = FacebookAccount.find_by_facebook_id(params[:id])
        if fb_account
            user = fb_account.user
	        sign_in user
	        redirect_back_or user.person
        else
        	flash[:error] = 'Ocorreu um erro ao conectar com sua conta do facebook'
			redirect_to sign_in_path
        end
  	end

	def create
		vv_account = ViventoAccount.find_by_email(params[:session][:email].downcase)
        if vv_account && vv_account.authenticate(params[:session][:password])
            user = vv_account.user
			sign_in user
       		redirect_back_or user.person
		else
    		flash[:error] = 'E-mail e/ou senha inválidos'
    		redirect_to sign_in_path
        end
	end

	def destroy
		sign_out
	    redirect_to sign_in_path
	end

end
