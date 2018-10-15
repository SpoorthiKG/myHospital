class MedicalreportsController < ApplicationController
  filter_access_to :all
  
  def new
    @medicalreport = Medicalreport.new
   @user = current_user
   @appointments = Appointment.find_all_by_doctor_id(@user.user_determin_id, :group => :patient_id)
  end
  
  def index
  end
  
  def create
    @user = current_user
    @appointments = Appointment.find_all_by_doctor_id(@user.user_determin_id , :group => :patient_id)
    @medicalreport = Medicalreport.new(:medication=> params[:medicalreport][:medication], :record =>params[:medicalreport][:record],:comments=>params[:medicalreport][:comments],:doctor_id => @user.user_determin_id, :patient_id =>params[:patients])
    if @medicalreport.save
      flash[:notice] = "You have successfully uploaded the file for the patient"
      redirect_to view_doctors_path
    else
      flash[:notice] = "Something went wrong!!! Try again"
      render "new"
    end
  end

  def record_view
    @user = current_user
    @records = Medicalreport.find_all_by_patient_id(@user.user_determin_id)
  end
end
