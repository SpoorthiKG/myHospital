class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def view
    
  end
  
  def signin
    if @user = User.authenticated?(params[:user][:first_name],params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "welcome #{@user.first_name}"    
      redirect_to view_users_path
    else
      flash[:notice] = "Invalid username and password"
      redirect_to root_path
    end
  end
  def patient_selection
    @patients = Patient.all
  end
  
  def adding_previous_histroy
    @histroys = DischargedPatient.find_all_by_patient_id(params[:id])
    render :update do |page|
      page.replace_html 'adding_previous_histroy', :partial => "adding_previous_histroy"
    end
  end

end
