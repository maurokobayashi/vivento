#encoding: utf-8
class CondosController < ApplicationController

    before_filter :require_authentication
    before_filter :require_admin, only: [:edit, :update, :destroy]

    def new
        @condo = Condo.new
    end

    def create
        @condo = Condo.new params[:condo]
        if @condo.save
            flash[:success] = "Condomínio cadastrado com sucesso"
        else
            render 'new'
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
