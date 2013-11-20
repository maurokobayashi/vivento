#encoding: utf-8
class PeopleController < ApplicationController

    before_filter :require_authentication
    before_filter :require_admin_or_private, only: [:edit, :update, :destroy]

    def index
        @people = Person.paginate(page: params[:page])
    end

    def show
        @person = Person.find params[:id]
        @timeline = @person.build_timeline
    end

    def me
        @person = current_person
        @timeline = @person.build_timeline
        render 'show'
    end

    def new
        @person = Person.new
        if current_user.has_facebook_account?
            fill_with_facebook(@person)
        else
            fill_with_vivento(@person)
        end
        render :layout => 'static'
    end

    def create
      @person = Person.new params.require(:person).permit(:name, :email, :picture, :apartment_id, :user_id)
        @person.user_id = current_user.id
        if @person.save
            flash[:success] = "Parabéns #{@person.name}! Sua conta foi criada."
            redirect_to @person
        else
            flash[:error] = "Que pena! Não conseguimos concluir seu cadastro. Preencha os campos obrigatórios e tente novamente."
            render :action => 'new', :layout => 'static'
        end
    end

    def edit
        @person = Person.find params[:id]
    end

    def update
        @person = Person.find params[:id]
        if @person.update_attributes params[:person]
            flash[:success] = "Seus dados foram atualizados."
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
            flash[:success] = "A conta do usuário '#{person.name} <#{person.email}>' foi excluída."
            redirect_to people_url
        end
    end

end