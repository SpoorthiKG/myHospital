class SlotsController < ApplicationController
  filter_access_to :all
  def index
    @doctors = Doctor.all
  end
  
  def new
    @doctor = Doctor.find(params[:doctor_id])
    @slot = @doctor.slots.build
  end
  
  def create
    @doctor = Doctor.find(params[:slot][:doctor_id])
    @slot = @doctor.slots.build(params[:slot])
    @slot.update_attributes(:is_booked => false)
    if @slot.save
      flash[:notice] = "the slot has been created successfully"
      redirect_to total_slots_slot_path(@doctor)
    else
       render :new
    end
end
  
  def total_slots
    @doctor = Doctor.find(params[:id])
    @slots = Slot.find_all_by_doctor_id(params[:id])
  end
 
  def destroy
   @doctor = Doctor.find(params[:doctor_id])
    @slot = Slot.find(params[:id])
    if @slot.is_booked == true
      flash[:notice] = 'Slot can not be Deleted Since there is an appointment for this Slot'
    else
      if @slot.destroy
    flash[:notice] = 'Slot has successfully been Deleted'
  else
    flash[:notice]='Something Went wrong!! Try Again'
  end
    end
     redirect_to total_slots_slot_path(@doctor)
  
end
end
