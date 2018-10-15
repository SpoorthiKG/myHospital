class PatientsController < ApplicationController
  def index
    
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params[:patient])
    if @patient.save
      redirect_to view_patients_path
    else
      render 'new'
    end
  end
  def view
    
  end
  def previous_histroy
    @user = current_user
    @discharged_patients = DischargedPatient.find_all_by_patient_id(@user.user_determin_id)
  end
  
  def change_password
    
  end
  
  def reset
    @user = current_user
    @patient = Patient.find_by_id(@user.user_determin_id)
    if params[:patient][:new_password].present?
        if @patient.update_attributes(:password => params[:patient][:new_password])
         flash[:notice] = "You have successfully changed your password"
         redirect_to :action => "view"    
       else
        puts "else"
        flash[:notice] = "Oops! Somethng went wrong"
        render change_password
        end
      else
         flash[:notice] = "Oops! Somethng went wrong"
         redirect_to :action => "view" 
      end  
  end
  
  def show
    @patient = Patient.find(params[:patient])
  end
end