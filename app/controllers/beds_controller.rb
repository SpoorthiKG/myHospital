class BedsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @bed = @room.beds.build
  end

  def create
    @room = Room.find(params[:bed][:room_id])
    @bed = @room.beds.build(params[:bed])
    @bed.vacant = 1
    if @bed.save
      flash[:notice] = "Successfully added bed into room"
      redirect_to adding_room_beds_path
    else
      render "new"
    end
  end

  def index
    @room = Room.find(params[:room_id])
    @bed = @room.beds
  end
  
  def adding_room
    @rooms = Room.all
  end
  
  def adding_bed
    render :update do |page|
      page.replace_html 'adding_bed', :partial => "adding_bed"
    end
  end
end
