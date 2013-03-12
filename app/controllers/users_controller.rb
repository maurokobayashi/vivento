#encoding: utf-8
class UsersController < ApplicationController

    before_filter :require_authentication, only: [:index, :show, :edit, :update, :destroy]
    before_filter :require_admin_or_private, only: [:edit, :update, :destroy]

    def index
        @users = User.paginate(page: params[:page])
    end

    def show
        @user = User.find params[:id]
    end

    def sign_up
        @user = User.new
        @vivento_account = ViventoAccount.new
        render :layout => 'static'
    end

    def sign_up_with_facebook
        @user = User.new
        @user.condo_id = params[:condo_id]
        if @user.save
            @facebook_account = FacebookAccount.new(
                :facebook_id => params[:facebook_id],
                :user_id => @user.id
            )
            if @facebook_account.save
                sign_in @user
                flash[:success] = "Falta pouco para criarmos sua conta. Informe seus dados pessoais para completar o cadastro"
                redirect_to new_person_path
            else
                flash[:error] = "Não foi possível concluir o cadastro com sua conta do facebook."
                render :action => 'sign_up', :layout => 'static'
            end
        else
            flash[:error] = "Não foi possível concluir o cadastro com sua conta do facebook."
            render :action => 'sign_up', :layout => 'static'
        end
    end

    def sign_up_with_vivento
        @user = User.new params[:user]
        if @user.save
            @vivento_account = ViventoAccount.new params[:vivento_account]
            @vivento_account.user_id = @user.id
            if @vivento_account.save
                sign_in @user
                # flash[:success] = "Falta pouco para criarmos sua conta. Informe seus dados pessoais para completar o cadastro."
                redirect_to new_person_path
            else
                flash[:error] = "Não foi possível concluir o cadastro. Preencha os campos obrigatórios."
                render :action => 'sign_up', :layout => 'static'
            end
        else
            flash[:error] = "Não foi possível concluir o cadastro. Preencha os campos obrigatórios."
            render :action => 'sign_up', :layout => 'static'
        end
    end

    def create
        @user = User.new params[:user]
        @user.condo_id = current_condo.id
        if @user.save
            flash[:success] = "Morador '#{@user.name}' cadastrado."
            redirect_to user_path(@user)
        else
            flash[:error] = "Não foi possível cadastrar morador. Preencha os campos obrigatórios."
            render :action => 'sign_up', :layout => 'static'
        end
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find params[:id]
    end

    def update
        @user = User.find params[:id]
        if @user.update_attributes params[:user]
            flash[:success] = "Seus dados foram atualizados."
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