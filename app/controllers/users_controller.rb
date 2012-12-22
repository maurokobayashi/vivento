#encoding: utf-8
class UsersController < ApplicationController

	include LoggerHelper

	before_filter :require_authentication, only: [:index, :show, :edit, :update]
	before_filter :private_access, only: [:edit, :update]

	def index
		@users = User.paginate(page: params[:page])
		render :layout => 'application'
	end

	def show
		@user = User.find params[:id]
		unless @user.nil?
			@condo = Condo.find @user.condo_id
			puts @condo
			render :layout => 'application'
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new params[:user]
		if @user.save
			sign_in @user
	    	flash[:success] = "Sua conta foi criada. Seja bem vindo!"
	    	redirect_to edit_user_path(@user)
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
    		flash[:error] = "Não foi possível alterar seus dados."
    		render :action => 'edit', :layout => 'application'
    	end
  	end

end