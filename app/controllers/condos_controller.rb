#encoding: utf-8
class CondosController < ApplicationController

    before_filter :require_authentication
    before_filter :require_admin, only: [:edit, :update, :destroy]

    def index
        @condos = Condo.all
        render 'list'
    end

    def new
        @condo = Condo.new
    end

    def create
        @address = Address.new(:street => params["street_name"], :number => params["street_number"], :complement => params["street_complement"], :district => params["street_district"], :zipcode => params["street_zipcode"], :city => params["street_city"], :state => params["street_state"], :country => "BRA")
        if @address.save
            @condo = Condo.new(:name => params["condo_name"], :website => params["condo_website"], :address_id => @address.id)
            if @condo.save
                flash[:success] = "Condomínio cadastrado com sucesso"
                redirect_to "/condos/#{@condo.id}"
            else
                render 'new'
            end
        end
    end

    def show
        @condo = Condo.find params[:id]
        unless @condo.nil?
            @address = Address.find @condo.address_id
        end
    end

    def edit
        @condo = Condo.find params[:id]
        @address = Address.find @condo.address_id
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
