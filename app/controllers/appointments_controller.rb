class AppointmentsController < ApplicationController
  #filter_access_to :create
  filter_access_to :all
  
  def new
    @appointment = Appointment.new
  end

  def create
    @user = current_user
    @slot = Slot.find(params[:slot])
    @appointment = Appointment.new
    @appointment.doctor_id = params[:doctor]
    @appointment.slot_id = params[:slot]
    @appointment.patient_id = @user.user_determin_id
    @appointment.appointment_date = @slot.slot_date
    if @appointment.save
      flash[:notice] = "You have successfully booked the appointment"
      redirect_to view_patients_path
  else
    render "index"
    end
  end

  def index
    @appointments = Appointment.all
  end
  
  def available_doctors
    @doctors = Department.find(params[:id]).doctors
    render :update do |page|
      page.replace_html 'available_doctors', :partial => "available_doctors"
    end
  end
  
  def book_an_appointment
    @departments = Department.all
  end
  
  def available_slots
    @slots = Doctor.find(params[:id]).slots
    render :update do |page|
      page.replace_html 'available_slots' , :partial => "available_slots"
    end
  end
  
  def appointments
    @user = current_user
    @appointments = Appointment.find_all_by_doctor_id(@user.user_determin_id)
  end
  
  def show
    @appointment = Appointment.find(params[:id])
  end

end