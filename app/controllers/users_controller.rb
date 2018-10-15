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
    @user = User.authenticated?(params[:user][:first_name],params[:user][:password])
    if @user.present?
      session[:user_id] = @user.id
      flash[:notice] = "welcome #{@user.first_name}"    
      if @user.user_determin_type == "patient"
        redirect_to view_patients_path
      elsif @user.user_determin_type == "doctor"
        redirect_to view_doctors_path
      else
        redirect_to view_users_path
      end
    else
      flash[:notice] = "Invalid username and password"
      redirect_to root_path
    end
  end

end
