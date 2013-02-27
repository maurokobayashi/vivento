#encoding: utf-8
class CondosController < ApplicationController

    before_filter :require_authentication
    before_filter :require_admin, only: [:edit, :update, :destroy, :create, :index]

    def index
        @condos = Condo.all
    end

    def new
        @condo = Condo.new
    end

    def create
        @condo = Condo.new(:name => params["condo_name"], :website => params["condo_website"])
        if @condo.save
            @address = Address.new(:condo_id => @condo.id, :street => params["street_name"], :number => params["street_number"], :complement => params["street_complement"], :district => params["street_district"], :zipcode => params["street_zipcode"], :city => params["street_city"], :state => params["street_state"], :country => "BRA")
            if @address.save
                flash[:success] = "Condomínio cadastrado com sucesso"
                redirect_to "/condos/#{@condo.id}"
            else
                render 'new'
            end
        end
    end

    def show
        @condo = Condo.find params[:id]
    end

    def edit
        @condo = Condo.find params[:id]
    end

    def update
        @condo = Condo.find params[:id]
        if @condo.update_attributes params[:condo]
            flash[:success] = "Dados do condomínio atualizados."
            redirect_to @condo
        else
            flash[:error] = "Não foi possível alterar os dados do condomínio."
            render 'edit'
        end
    end

end
