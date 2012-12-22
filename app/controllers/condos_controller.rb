#encoding: utf-8
class CondosController < ApplicationController

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

end
