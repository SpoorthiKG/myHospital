class DoctorSuggestedPatientsController < ApplicationController
  def new
    puts "===================coming here"
    @doctor_suggested_patient = DoctorSuggestedPatient.new
    @doctor_suggested_patient.patient_id = params[:id]
    @doctor_suggested_patient.doctor_id = params[:doc_id]
    @doctor_suggested_patient.to_be_admitted = 1
    @doctor_suggested_patient.save
  end

  def create
    puts "================================coming inside"
    @doctor_suggested_patient = DoctorSuggestedPatient.new
    @doctor_suggested_patient.patient_id = params[:id]
    @doctor_suggested_patient.doctor_id = params[:doc_id]
    @doctor_suggested_patient.to_be_admitted = 1
    if  @doctor_suggested_patient.save
      render "index"
    else
      render "new"
    end
  end
  def index
    @doctor_suggested_patients = DoctorSuggestedPatient.all
  end
  def display_patient
    @doctor_suggested_patients = DoctorSuggestedPatient.all
    
  end
 

end
