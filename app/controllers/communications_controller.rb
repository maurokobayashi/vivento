#encoding: utf-8
class CommunicationsController < ApplicationController


    before_filter :require_authentication
    before_filter :require_admin, only: [:new, :create, :edit, :update, :destroy]

    def index
        @communications = Communication.all
    end

    def new
        @communication = Communication.new
    end

    def create
        communication = Communication.new params[:communication]
        create_building params[:buildings], communication
        if communication.save!
            redirect_to communication
        else
            flash[:error] = "Não foi possível colar o comunicado. Pode tentar novamente?"
            render 'new'
        end
    end

    def update
    end

    def show
        @communications = Communication.find params[:id]
    end

    def edit
        @communications = Communication.find params[:id]
    end

    def show
        @communications = Communication.find params[:id]
    end

    def create_building buildings, communication
      if !buildings.nil?
        buildings.each do | building |
          BuildingCommunication.create!(:building => Building.find(building), :communication => communication)
        end
      end
    end
end
