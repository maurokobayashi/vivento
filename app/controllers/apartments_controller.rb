#encoding: utf-8
class ApartmentsController < ApplicationController

  	before_filter :require_admin

	def new
		@apartment = Apartment.new
	end

	def create
		@apartment = Apartment.new params[:apartment]
		if @apartment.save
	    	flash[:success] = "Apartamento '#{@apartment.number}' cadastrado com sucesso."
	    	redirect_to apartments_path
		else
			flash[:error] = "Não foi possível cadastrar o apartamento '#{@apartment.number}'."
			render 'new'
	    end
  	end

  	def index
  		@apartments = Apartment.all
  	end

  	def edit
  		@apartment = Apartment.find params[:id]
  	end

  	def update
  		@apartment = Apartment.find params[:id]
  		if @apartment.update_attributes params[:apartment]
    		flash[:success] = "Os dados do apartamento '#{@apartment.number}' foram atualizados."
			redirect_to apartments_path
    	else
    		flash[:error] = "Não foi possível alterar os dados do apartamento '#{@apartment.number}'."
    		render 'edit'
    	end
  	end

end
