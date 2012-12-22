#encoding: utf-8
class AddressesController < ApplicationController

	def new
		@address = Address.new
	end

	def create
		@address = Address.new params[:address]
		if @address.save
	    	flash[:success] = "Endereço cadastrado com sucesso"
		else
			render 'new'
	    end
  	end

end
