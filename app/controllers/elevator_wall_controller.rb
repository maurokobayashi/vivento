class ElevatorWallController < ApplicationController
  def new
    @elevator_wall = ElevatorWall.new
  end

  def create
    puts params
    elevator_wall = ElevatorWall.new(:subject => params["subject"], :communication => params["communication"], :expiration_date => params["expiration_date"], :creation_date => Time.now, :creation_time => Time.now)
    elevator_wall.save!

    render :index
  end

  def edit
  end

  def remove
  end

  def index
    @elevator_walls = ElevatorWall.all
  end
end
