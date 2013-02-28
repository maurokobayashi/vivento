#encoding: utf-8
class UsersController < ApplicationController

    before_filter :require_authentication, only: [:index, :show, :edit, :update, :destroy]
    before_filter :require_admin_or_private, only: [:edit, :update, :destroy]

    def index
        @users = User.paginate(page: params[:page])
    end

    def show
        @user = User.find params[:id]
        puts @user.apartment_id
    end

    def sign_up
        @user = User.new
        render :layout => 'static'
    end

    def sign_up_confirm
        @user = User.new params[:user]
        if @user.save
            sign_in @user
            flash[:success] = "Falta pouco para criarmos sua conta. Informe seus dados pessoais para completar o cadastro."
            redirect_to edit_user_path(@user)
        else
            render 'new'
            flash[:error] = "Não foi possível cadastrar morador. Preencha os campos obrigatórios."
        end
    end

    def new
        @user = User.new
    end

    def create
        condo_id = current_condo.id
        @user = User.new params[:user]
        @user.condo_id = condo_id
        if @user.save
            flash[:success] = "Morador '#{@user.name}' cadastrado."
            redirect_to user_path(@user)
        else
            flash[:error] = "Não foi possível cadastrar morador. Preencha os campos obrigatórios."
            render 'new'
        end
    end

    def edit
        @user = User.find params[:id]
    end

    def update
        @user = User.find params[:id]
        if @user.update_attributes params[:user]
            flash[:success] = "Seus dados foram atualizados."
            sign_in @user
            redirect_to @user
        else
            flash[:error] = "Não foi possível atualizar seus dados. Preencha os campos obrigatórios."
            render 'edit'
        end
    end

    def destroy
        user = User.find(params[:id]).destroy
        if current_user?(user)
            flash[:success] = "#{user.name}, sua conta foi excluída. Caso queira reativa-la, clique aqui."
            redirect_to root_path
        else
            flash[:success] = "A conta do usuário '#{user.name} <#{user.email}>' foi excluída."
            redirect_to users_url
        end
    end

end