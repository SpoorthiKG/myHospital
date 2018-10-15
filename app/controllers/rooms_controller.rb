class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params[:room])
    if @room.save
      redirect_to rooms_path
    else
      render "create"
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

end
