class UsersController < ApplicationController

	before_filter :require_authentication, only: [:show, :edit, :update]

	def show
		@user = User.find params[:id]
		render :layout => 'application'
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new params[:user]
		if @user.save
			sign_in @user
	    	flash[:success] = "Sua conta foi criada. Seja bem vindo!"
	    	redirect_to @user
		else
			render 'new'
	    end
  	end

  	def edit
  		@user = User.find params[:id]
		render :layout => 'application'
  	end

  	def update
    	@user = User.find params[:id]
    	if @user.update_attributes params[:user]
    		flash[:success] = "Seus dados foram atualizados."
			sign_in @user
			redirect_to @user
    	else
    		render :action => 'edit', :layout => 'application'
    	end
  	end

end