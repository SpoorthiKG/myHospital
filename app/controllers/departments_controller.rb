class DepartmentsController < ApplicationController
  filter_access_to :all
  def new
    @department = Department.new
  end

  def index
    @departments = Department.all
     @user = current_user
  end
   def show
     @department = Department.find(params[:id])
     @user = current_user
   end
  
  def create
    @department = Department.new(params[:department])
    if @department.save
      flash[:notice]= 'You have successfully created the department'
      redirect_to departments_path
    else
      render :new
    end
  end
  
  def edit
  @department = Department.find(params[:id])
end

def update
  @department = Department.find(params[:id])
    if @department.update_attributes(params[:department])
      flash[:notice] = 'Department Details was successfully updated.'
      redirect_to departments_path
    else
      render :edit
    end
  end 
  def destroy
  @doctors = Doctor.find_all_by_department_id(params[:id])
  @department = Department.find(params[:id])
  if @doctors.present?
    flash[:notice]="There are Doctors under this department!! You can not delete this department"
  else
    if @department.destroy
    flash[:notice] = 'Department has successfully been Deleted'
  else
    flash[:notice]='Something Went wrong!! Try Again'
  end
  end
  redirect_to departments_path
end
end
