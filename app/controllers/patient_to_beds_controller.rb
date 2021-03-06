class PatientToBedsController < ApplicationController
  filter_access_to :all
  def new
    @rooms = Room.all
    @patient_to_bed = PatientToBed.new
  end
   def available_beds
    @beds = Bed.all(:conditions => ["room_id = ? AND vacant = ?", params[:id], true])
    if  @beds.present?
    render :update do |page|
      page.replace_html 'available_beds', :partial => "available_beds"
    end
    else
      flash[:notice] = "No Beds in the selected room.. please select another room"
      render "new"
    end
  end

  def create
    @rooms = Room.all
    @bed = Bed.find(params[:bed])
    @patient_to_bed = PatientToBed.new(:bed_id=>params[:bed],:patient_id=>params[:patient_id],
      :vacated=>0, :admitted_on =>Time.now )
    if @patient_to_bed.save and @bed.update_attributes(:vacant=> false) 
      @doctor_suggested_patient = DoctorSuggestedPatient.find_by_patient_id(params[:patient_id])
      @doctor_suggested_patient.destroy
      flash[:notice] = "The patient is allotted a bed"
    else
      flash[:notice] = "Oops!!! Something went wrong! Try again "
    end
    redirect_to doctor_suggested_patients_path
  end

  def index
    @patient_to_beds = PatientToBed.all
  end
  def destroy
    @patient_to_bed = PatientToBed.find(params[:id])
    @bed = Bed.find(@patient_to_bed.bed_id)
    @bed.update_attributes(:vacant=>true)  
    @discharged_patient = DischargedPatient.new(:bed_id => @patient_to_bed.bed_id,:patient_id => @patient_to_bed.patient_id,:admitted_on => @patient_to_bed.admitted_on,:discharged_on => Time.now)
    @discharged_patient.save
    @patient_to_bed.destroy
    if @patient_to_bed.destroy and @bed.save and @discharged_patient.save
      flash[:notice] = "The patient has been discharged"
    else
      flash[:notice] = "something went wrong!! try again"
    end
    redirect_to patient_to_beds_path
  end

end