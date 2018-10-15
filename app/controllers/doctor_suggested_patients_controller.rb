class DoctorSuggestedPatientsController < ApplicationController
  def new
    @doctor_suggested_patient = DoctorSuggestedPatient.new
  end

  def create
    @doctor_suggested_patient = DoctorSuggestedPatient.new(:patient_id => params[:id],:doctor_id => params[:doc_id],:to_be_admitted => 1)
    if  @doctor_suggested_patient.save
      render "index"
    else
      flash[:notice] = 'Something went wrong!!Try again'
      render 'index'
    end
  end
  def index
    @doctor_suggested_patients = DoctorSuggestedPatient.all
  end
  def display_patient
    @doctor_suggested_patients = DoctorSuggestedPatient.all
    
  end
 

end
