#encoding: utf-8
require 'net/http'
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

  def update
  	address = Address.find params[:id]

  	if address.update_attributes params[:address]
        flash[:success] = "Dados do condomínio atualizados."
        redirect_to "/condos/#{params[:id]}"
    else
        flash[:error] = "Não foi possível alterar os dados do condomínio."  
        render "/condo/edit"
    end
  end

  def cep
    url = "http://grepcep.com/callws.do?token=201301252646765DMTQIOLT29LRN7TTCTC4&cep=#{params[:number]}&style=json"
    

    respond_to do |format|
      format.html  { render :json => JSON.parse(Net::HTTP.get(URI.parse(url))) }
      format.json  { render :json => JSON.parse(Net::HTTP.get(URI.parse(url))) }
    end
  end
end