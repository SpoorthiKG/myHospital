class AppointmentsController < ApplicationController
  #filter_access_to :create
  filter_access_to :all
  
  def new
    @appointment = Appointment.new
  end

  def create
    @user = current_user
    @slot = Slot.find(params[:slot])
    @slot.is_booked = 1
    @slot.save
    @appointment = Appointment.new(:doctor_id =>params[:doctor],:slot_id=> params[:slot],:patient_id=>@user.user_determin_id,:appointment_date=>@slot.slot_date,:is_booked=>1)
    if @appointment.save
      flash[:notice] = "You have successfully booked the appointment"
      redirect_to view_patients_path
  else
    flash[:notice]= 'Something went wrong!!! Try again'
    redirect_to view_patients_path
    end
  end

  def index
    @appointments = Appointment.all
  end
  
  def available_doctors
    @doctors = Department.find(params[:id]).doctors
    if @doctors.present?
    render :update do |page|
      page.replace_html 'available_doctors', :partial => "available_doctors"
    end
    else
      render :update do |page|
        page.replace_html 'available_doctors', :partial => "no_doctors"
      end
    end
  end
  
  def book_an_appointment
    @departments = Department.all
  end
  
  def available_slots
    @slots = Slot.find_all_by_doctor_id(params[:id],:conditions => ["is_booked = ?", false])
    if @slots.present?
      render :update do |page|
        page.replace_html 'available_slots' , :partial => "available_slots"
      end
    else
      render :update do |page|
        page.replace_html 'available_slots' , :partial => "no_slots"
    end
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