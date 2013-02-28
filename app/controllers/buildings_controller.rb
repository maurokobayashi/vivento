#encoding: utf-8
class BuildingsController < ApplicationController

    before_filter :require_authentication
    before_filter :require_admin

    def new
        @building = Building.new
    end

    def create
        @building = Building.new params[:building]
        if @building.save
            flash[:success] = "Bloco cadastrado com sucesso."
            redirect_to buildings_path
        else
            if @building.name.empty?
                flash[:error] = "Não foi possível cadastrar o bloco."
            else
                flash[:error] = "Não foi possível cadastrar o bloco '#{@building.name}'."
            end
            render 'new'
        end
    end

    def index
        @buildings = Building.all
    end

    def edit
        @building = Building.find params[:id]
    end

    def update
        @building = Building.find params[:id]
        if @building.update_attributes params[:building]
            flash[:success] = "Os dados do bloco '#{@building.name}' foram atualizados."
            redirect_to buildings_path
        else
            flash[:error] = "Não foi possível alterar os dados do bloco '#{@building.name}'."
            render 'edit'
        end
    end

end
