#encoding: utf-8
class CommunicationsController < ApplicationController
  def index
    @communications = Communication.all
  end

  def new
    @communication = Communication.new
  end

  def create
    communication = Communication.new params[:communication]
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
end
