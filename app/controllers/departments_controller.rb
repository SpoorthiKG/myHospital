class DepartmentsController < ApplicationController
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
      flash[:notice]='Something went wrong try again'
      redirect_to new_department_path
    end
  end
end
