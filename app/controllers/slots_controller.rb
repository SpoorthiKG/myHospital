class SlotsController < ApplicationController
  
  def index
    @doctors = Doctor.all
  end
  
  def new
    puts "================#{params[:doctor_id]}"
    @doctor = Doctor.find(params[:doctor_id])
    @slot = @doctor.slots.build
  end
  
  def create
    @doctor = Doctor.find(params[:slot][:doctor_id])
    @slot = @doctor.slots.build(params[:slot])
    if @slot.save
      flash[:notice] = "the slot has been created successfully"
      redirect_to slots_path
    else
      flash[:notice] = "the slot was unable to create"
       redirect_to slots_path
    end
  end
  
  
end
