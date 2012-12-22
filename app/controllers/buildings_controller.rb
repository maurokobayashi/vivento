#encoding: utf-8
class BuildingsController < ApplicationController

	def new
		@building = Building.new
	end

	def create
		@building = Building.new params[:building]
		if @building.save
	    	flash[:success] = "Bloco cadastrado com sucesso"
		else
			render 'new'
	    end
  	end

end
