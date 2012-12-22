#encoding: utf-8
class UsersController < ApplicationController

	before_filter :require_authentication, only: [:index, :show, :edit, :update]
	before_filter :private_access, only: [:edit, :update]

	def index
		@users = User.paginate(page: params[:page])
		render :layout => 'application'
	end

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
	    	flash[:success] = "Parabéns! Sua conta foi criada. Informe seus dados pessoais para completar o cadastro."
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