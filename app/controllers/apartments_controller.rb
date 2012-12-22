#encoding: utf-8
class ApartmentsController < ApplicationController

	def new
		@apartment = Apartment.new
	end

	def create
		@apartment = Apartment.new params[:apartment]
		if @apartment.save
	    	flash[:success] = "Apartamento cadastrado com sucesso"
		else
			render 'new'
	    end
  	end

end
