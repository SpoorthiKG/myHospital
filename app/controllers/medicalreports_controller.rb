class MedicalreportsController < ApplicationController
  filter_access_to :all
  
  def new
    @medicalreport = Medicalreport.new
   @user = current_user
   @appointments = Appointment.find_all_by_doctor_id(@user.user_determin_id, :group => :patient_id)
  end
  
  def index
    @patients = Patient.all
  end
  
  def create
    @user = current_user
    @appointments = Appointment.find_all_by_doctor_id(@user.user_determin_id , :group => :patient_id)
    @medicalreport = Medicalreport.new(:medication=> params[:medicalreport][:medication], 
      :record =>params[:medicalreport][:record],:comments=>params[:medicalreport][:comments],
      :doctor_id => @user.user_determin_id, :patient_id =>params[:patients])
    if @medicalreport.save
      flash[:notice] = "You have successfully uploaded the file for the patient"
      redirect_to view_users_path
    else
      render :new
    end
  end

  def record_view
    @user = current_user
    @records = Medicalreport.find_all_by_patient_id(@user.user_determin_id)
  end
  
  def adding_report
    @reports = Medicalreport.find_all_by_patient_id(params[:id])
    render :update do |page|
      page.replace_html 'adding_report', :partial => "adding_report"
    end
  end
end
