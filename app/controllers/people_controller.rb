#encoding: utf-8
class PeopleController < ApplicationController

    before_filter :require_authentication, only: [:create, :index, :show, :edit, :update, :destroy]
    before_filter :require_admin_or_private, only: [:edit, :update, :destroy]

    def index
        @people = Person.paginate(page: params[:page])
    end

    def show
        @person = Person.find params[:id]
    end

    def new
        @person = Person.new
    end

    def create
        @person = Person.new params[:person]
        @person.user_id = current_user.id
        if @person.save
            flash[:success] = (@person.is_admin? ? "Síndico" : "Morador") + " '#{@person.name}' cadastrado."
            redirect_to @person
        else
            flash[:error] = "Não foi possível cadastrar morador. Preencha os campos obrigatórios."
            render 'new'
        end
    end

    def edit
        @person = Person.find params[:id]
    end

    def update
        @person = Person.find params[:id]
        if @person.update_attributes params[:person]
            flash[:success] = "Seus dados foram atualizados."
            sign_in @person.user
            redirect_to @person
        else
            flash[:error] = "Não foi possível atualizar seus dados. Preencha os campos obrigatórios."
            render 'edit'
        end
    end

    def destroy
        person = Person.find(params[:id]).destroy
        if current_user?(person.user)
            flash[:success] = "#{person.name}, sua conta foi excluída. Caso queira reativa-la, clique aqui."
            redirect_to root_path
        else
            flash[:success] = "A conta do usuário '#{person.name} <#{person.user.email}>' foi excluída."
            redirect_to people_url
        end
    end

end