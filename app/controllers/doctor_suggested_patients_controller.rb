class DoctorSuggestedPatientsController < ApplicationController
  def new
    puts "======================coming here"
    @doctor_suggested_patient = DoctorSuggestedPatient.new(:patient_id => params[:id],:doctor_id => params[:doc_id],:to_be_admitted => 1)
    @doctor_suggested_patient.save
  end
  
  def index
    @doctor_suggested_patients = DoctorSuggestedPatient.all
  end
 
  def destroy
 @doctor_suggested_patients = DoctorSuggestedPatient.find(params[:id])
  if @doctor_suggested_patients.destroy
    flash[:notice] = 'Patient has successfully been Removed from the list'
  else
    flash[:notice]='Something Went wrong!! Try Again'
  end
  redirect_to doctor_suggested_patients_path
  end

end
