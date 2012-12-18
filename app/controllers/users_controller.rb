class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		render :layout => 'application'
	end

	def new
		@user = User.new
	end

	def create
	    @user = User.new(params[:user])
	    if @user.save
	    	flash[:success] = "Sua conta foi criada. Seja bem vindo!"
	    	redirect_to @user
	    else
	    	render 'new'
	    end
  	end
end
