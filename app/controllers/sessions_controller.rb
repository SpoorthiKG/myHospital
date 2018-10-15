class SessionsController < ApplicationController
  def new
    @user = User.new  
  end
  
  def create    
    user = User.authenticate(params[:sessions_path][:name],params[:sessions_path][:password])
      if user.present?
      session[:user_id] = user.id
      flash[:notice] = "welcome #{user.name}"
      redirect_to root_url
    else
      flash[:notice] = "email or password doesn't match."
      redirect_to new_session_path
    end
  end
 
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
