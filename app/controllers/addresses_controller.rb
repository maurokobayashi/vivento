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

end