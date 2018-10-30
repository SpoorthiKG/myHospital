class DoctorsController < ApplicationController
  filter_access_to :all
  def new
    @department = Department.find(params[:department_id])
    @doctor = @department.doctors.build
  end

  def index
    @department = Department.find(params[:department_id])
    @doctors = @department.doctors
  end
  def create
    @department = Department.find(params[:doctor][:department_id])
    @doctor = @department.doctors.build(params[:doctor])
    if @doctor.save
      render :show
    else
      render :new
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
    @user = current_user
    @doctor = Doctor.find(@user.user_determin_id)
    if @doctor.update_attributes(:password => params[:doctor][:new_password])
      flash[:notice] = "You have successfully changed your password"
      redirect_to view_users_path
    else
      flash[:notice] = "Oops! Somethng went wrong"
      render change_password
    end
  end
  
  def patients_being_treated
    @user = current_user
    @patients = Appointment.find_all_by_doctor_id(@user.user_determin_id, :group => :patient_id)
  end
  def showing
       @user = current_user
    @patients = Appointment.find_all_by_doctor_id(@user.user_determin_id, :group => :patient_id)
    respond_to do |format|
      format.pdf do
        render :pdf => "showing",
         :template => 'doctors/showing.pdf.erb',
         :layout => 'showing.html'              
      end
    end
  end
  
  def edit
   @department = Department.find(params[:department_id])
   @doctor = @department.doctors.find(params[:id])
  end

  def update
    @department = Department.find(params[:doctor][:department_id])
   @doctor = @department.doctors.find(params[:id])
   if  @doctor.update_attributes(params[:doctor])
      flash[:notice] = 'Doctor Details was successfully updated.'
      redirect_to department_doctors_path(@department)
    else
      render :edit
    end
  end 
  def destroy
    @department = Department.find(params[:department_id])
    @doctor = Doctor.find(params[:id])
  if @doctor.destroy
    flash[:notice] = 'Doctor has successfully been Deleted'
  else
    flash[:notice]='Something Went wrong!! Try Again'
  end
  redirect_to department_doctors_path(@department)
  end
end
