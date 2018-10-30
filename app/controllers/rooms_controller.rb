class RoomsController < ApplicationController
  filter_access_to :all
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params[:room])
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def index
    @rooms = Room.all
  end
  
  def export_csv_records
    @rooms = Room.all
    csv_str = FasterCSV.generate do |csv|
      csv << ["Room_Number", "Total_beds", "Vacant_Beds"]
      @rooms.each do |p|
        csv << [p.room_number, p.beds.count, p.beds.count(:conditions => "vacant = true")]
      end
    end
    send_data(csv_str, :type => "/text/csv", :filename=>"Rooms_Utilization.csv")
  end

  def edit
  @room = Room.find(params[:id])
end

def update
  @room = Room.find(params[:id])
    if @room.update_attributes(params[:room])
      flash[:notice] = 'Room Details was successfully updated.'
      redirect_to rooms_path
    else
      render :edit
    end
  end 
  def destroy
 @room = Room.find(params[:id])
 @beds = Bed.find_all_by_room_id(params[:id])
 if @beds.present?
   flash[:notice]="You can not delete this room since there are beds under it!!"
 else
  if @room.destroy
    flash[:notice] = 'Room has successfully been Deleted'
  else
    flash[:notice]='Something Went wrong!! Try Again'
  end
 end
  redirect_to rooms_path
  end
end
