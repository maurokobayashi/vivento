#encoding: utf-8
class SessionsController < ApplicationController

	def new
		render :layout => 'static'
  	end

  	def sign_in_with_facebook
	    fb_account = FacebookAccount.find_by_facebook_id(params[:id])
        if fb_account
            user = fb_account.user
	        sign_in user
	        redirect_to me_path
        else
        	flash[:error] = 'Ocorreu um erro ao conectar com sua conta do facebook'
			redirect_to sign_in_path
        end
  	end

	def sign_in_with_vivento
		vv_account = ViventoAccount.find_by_email(params[:session][:email].downcase)
        if vv_account && vv_account.authenticate(params[:session][:password])
            user = vv_account.user
			sign_in user
       		# redirect_back_or me_path
            redirect_to me_path
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
