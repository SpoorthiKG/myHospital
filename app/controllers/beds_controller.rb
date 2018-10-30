class BedsController < ApplicationController
  filter_access_to :all
  def new
    @room = Room.find(params[:room_id])
    @bed = @room.beds.build
  end

  def create
    @room = Room.find(params[:bed][:room_id])
    @bed = @room.beds.build(params[:bed])
    @bed.update_attributes(:vacant=>1)
    if @bed.save
      flash[:notice] = "Successfully added bed into room"
      redirect_to adding_room_beds_path
    else
      render :new
    end
  end

  def index
    @rooms = Room.all
  end
  
  def adding_room
    @rooms = Room.all
  end
  
  def adding_bed
    render :update do |page|
      page.replace_html 'adding_bed', :partial => "adding_bed"
    end
  end
  
  def listing_beds
    @beds = Bed.find_all_by_room_id(params[:id])
    render :update do |page|
      page.replace_html 'listing_beds', :partial => "listing_beds"
    end
  end
  
  def destroy
 @bed = Bed.find(params[:id])
 if @bed.destroy
    flash[:notice] = 'Bed has successfully been Deleted'
  else
    flash[:notice]='Something Went wrong!! Try Again'
  end
  redirect_to beds_path
 end
 
  def new_bed
    @room = Room.find(params[:room_id])
    render :update do |page|
      page.replace_html 'new_bed', :partial => "new_bed"
    end
  end
end
