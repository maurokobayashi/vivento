#encoding: utf-8
class SessionsController < ApplicationController

	def new
		render :layout => 'users'
  	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)

		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or user
		else
			flash[:error] = 'E-mail e/ou senha inválidos'
			redirect_to signin_path
		end
	end

	def destroy
		sign_out
	    redirect_to signin_path
	end

end
