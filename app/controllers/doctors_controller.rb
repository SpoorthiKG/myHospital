class DoctorsController < ApplicationController
  def new
    @department = Department.find(params[:department_id])
    @doctor = @department.doctors.build
  end

  def index
    @department = Department.find_by_id(params[:department_id])
    @doctors = @department.doctors
    @user = current_user
   
  end
  def create
    @department = Department.find_by_id(params[:doctor][:department_id])
    @doctor = @department.doctors.build(params[:doctor])
    if @doctor.save
      render "show"
    else
      render 'new'
    end
  end
  def show
    @department = Department.find(params[:department_id])
    @doctor = @department.doctors.find(params[:id])
  end
  def recommend_patient
    @user = current_user
    @appointments = Appointment.find_all_by_doctor_id(@user.user_determin_id, :group => :patient_id)
  end
  
  def change_password
    
  end
  def reset
    puts "========================coming inside reset"
    @user = current_user
    @doctor = Doctor.find_by_id(@user.user_determin_id)
    puts "=============================#{@patient.inspect}"
    @doctor.update_attributes(:password => params[:doctor][:new_password])
    #@user.update_attributes(:encrypted_password => params[:doctor][:new_password])
    @user.save
    if @doctor.save && @user.save
      flash[:notice] = "You have successfully changed your password"
      redirect_to view_doctors_path
    else
      flash[:notice] = "Oops! Somethng went wrong"
      render change_password
    end
  end
  
  def patients_being_treated
    @user = current_user
    @patients = Appointment.find_all_by_doctor_id(@user.user_determin_id, :group => :patient_id)
    comment = Medicalreport.find_all_by_doctor_id(@user.user_determin_id)
  end
  def showing
       @user = current_user
    @patients = Appointment.find_all_by_doctor_id(@user.user_determin_id, :group => :patient_id)
    respond_to do |format|
      format.pdf do
        render :pdf => "showing",
         :template => 'doctors/showing.pdf.erb',
         :layout => 'showing.html'                  # use 'pdf.html' for a pfd.html.erb file
      end
    end
  end
end
